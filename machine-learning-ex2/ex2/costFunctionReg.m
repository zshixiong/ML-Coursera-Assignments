function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
thetaSize = size(theta);
for i = 1:m
    h = sigmoid(X(i,:)*theta);
    J = J + (-y(i)*log(h) - (1-y(i))*log(1-h));
end
J = J/m + lambda/(2*m)*sum(theta(2:thetaSize(1),:).^2);

thetaSize = size(theta);
for j = 1:thetaSize(1)
    for i = 1:m
        h = sigmoid(X(i,:)*theta);
        grad(j) = grad(j) + (h-y(i))*X(i,j);
    end
    if 1==j
        grad(j) = grad(j)/m;
    else
        grad(j) = grad(j)/m + lambda/m*theta(j);
    end
end
% =============================================================

end
