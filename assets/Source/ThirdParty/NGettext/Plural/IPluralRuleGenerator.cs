﻿using System;
using System.Globalization;

namespace Rotorz.Games.Localization.Internal.NGettext.Plural
{
	/// <summary>
	/// Plural rule generator.
	/// </summary>
	public interface IPluralRuleGenerator
	{
		/// <summary>
		/// Creates a plural rule for given culture.
		/// </summary>
		/// <param name="cultureInfo"></param>
		/// <returns></returns>
		IPluralRule CreateRule(CultureInfo cultureInfo);
	}
}