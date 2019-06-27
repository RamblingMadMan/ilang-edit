#ifndef ILE_REPLOUTPUT_HPP
#define ILE_REPLOUTPUT_HPP 1

#include "ilang/Expr.hpp"

#include "Editor.hpp"

namespace ile{
	class ReplOutput{
		public:
			enum class EditMode { Editable, ReadOnly };

			ReplOutput(ilang::ExprPtr input_, ilang::ResultPtr result_)
				: input(std::move(input_))
				, result(std::move(result_))
			{}

			void paint(QPainter *painter, const QRect &rect, const QPalette &palette, EditMode mode) const{

			}

		private:
			ilang::ExprPtr input;
			ilang::ResultPtr result;
	};
}

Q_DECLARE_METATYPE(ile::ReplOutput)

#endif // !ILE_REPLOUTPUT_HPP
