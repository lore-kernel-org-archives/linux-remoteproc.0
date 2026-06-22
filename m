Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032034EF1F;
	Mon, 22 Jun 2026 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123382; cv=none; b=KzMQz5VOZp1hz4umfL3eZZMKOSs/i0qk+JaWk5ng1Fv9TpEsJRGlxWZomCTUWxAaTIfv2KT1nW0mPKEF/x9UJSfoArck94hnnaT6US7j5+2brjo0Y4Zaw1AOnnhOpX9N7+yPE7oh+TdFsy/NMxyJQcVKsts1vrj+9a7e0OEAT+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123382; c=relaxed/simple;
	bh=7bx/8kCnvlkgy1MTA0DRMn+LreWQeqdEC6FFpkhw6cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQskgXgGotMOyvW07xbORm8lp2WPF8zbkdKBFtLdCaCVCClL0RxJDxt517+N7CNoEqgww4YPNwgZE8MpTkalGBMzexd3ccJiUMDt5glFcHAW4ZKDgY0Jind3tExtLRreu00F2qbBPgRFw8I38s2FNt5sTUX2VKrkSbNPlnAYUAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGCPMiSe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGCPMiSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782123380; x=1813659380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7bx/8kCnvlkgy1MTA0DRMn+LreWQeqdEC6FFpkhw6cM=;
  b=lGCPMiSemZzxLr3Q+Ot52HDvssjHKq+MWQNgEH1ZmSTkNCj6rCD1LdGh
   oCrwdwRF/74AyDnsaDR6MBUgFxSxdLyOBXzfICr7s1bhJ3cobldEacHNJ
   VXo6nMhCM70+F/O8oIgL79vgdy0HAih3zhn9C0l/LZj7yYbmH1It+KOC5
   +0ao3oGwZMBQaux6knLtdQM8SF+5+LfceMzPRnIW9bGHxaWT6hqoeGTaz
   eQ9kUebXdsm0jgl7y0GInpU9oqQfvH6vyJ/+qX/T/naX60T+OEph4bCZ/
   lnNZaFt7+jEpAEvjT0/6hWsqVDwf1jmnREe13VvYmlaJuHta8UIOfuzeu
   A==;
X-CSE-ConnectionGUID: s6aZJ/PVSqaqKnwTea7lEw==
X-CSE-MsgGUID: jBSUbEZYQsW7Lc4Li75U3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86759414"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86759414"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:16:20 -0700
X-CSE-ConnectionGUID: SJJXlP+VSSOvavM2V0a7zA==
X-CSE-MsgGUID: L+XmsUOkQbyw0+kxNOI4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="249243366"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:16:19 -0700
Date: Mon, 22 Jun 2026 13:16:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] radix-tree: add parameter doc for
 radix_tree_deref_slot_protected()
Message-ID: <ajkLcIEwug2aFZal@ashevche-desk.local>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <20260622085204.54248-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622085204.54248-2-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 22, 2026 at 10:52:00AM +0200, Wolfram Sang wrote:
> Add the missing documentation for the 'treelock' parameter.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


