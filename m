Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438011B6D08;
	Sat, 29 Nov 2025 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764429855; cv=none; b=ldYvyuavkev3nxu6QATyM1etol/BO5YI5DsJdHSuXgq+mRqXgpNE8Rdnylb0F2lPHYIipbIoRkQGYO/wjLgBqjmw+HX9lwdl06b/hLc+y4+gPBrMDjq5KGejucGcnMwM7IVrDrEp+Vh+5uUKclF+ouCoy3fTxPosTGLZ4Ca+mTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764429855; c=relaxed/simple;
	bh=ON/S1/1JqDhXbvfPTB+yJBbOTXW6uhtSjwU21O/q/Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIFPEM/gMAxIrP13VqM44w8NHzyv2hFpjZmCdAa9B2bps9BUz3e3dY3VENzFiccYwMI55tu07cSqU/objQJJndU/9UzghAGqAVyllfb4xYz8f5/pFK3KsnavVXAGThbZMz91bQitMMYaPQ9+E9OvSDImMFKjGLsVdc/PE2l0XKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkQKkM1d; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkQKkM1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764429854; x=1795965854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ON/S1/1JqDhXbvfPTB+yJBbOTXW6uhtSjwU21O/q/Wc=;
  b=FkQKkM1d3rZwNimEVHNKFsHPwP9blmXR+FIJJva3t6H/cmg+AViwRVr8
   XovxHhh3mlRyIvUAarCrHj2hZa89tn8zYXk5LpxyYnME2AQKHdAApnuva
   5U/A8B9G89jgdOlGc6QfmkpiEtNOxUDJZ2rB4sGyTZOSc21X9cEtrCCU6
   pZVz97PcCAmEMZIAU8SvyFGw/iTWmNpo4BcdHaBqCobs3OcC1BopTSYZs
   xH0na6/7MPmRANBsYwC5vXNoEbcSg7UQRSA+8QHoUjBLN+Pc8Yf5eR4VL
   fN5Y7T6KOqLTMcp6gdK9UsWTU4FS4JM0cPBYU79iyRvY8EpMyA8IrnOGV
   Q==;
X-CSE-ConnectionGUID: aC0oAT0iTPiUkzZgHHd/Xw==
X-CSE-MsgGUID: pbw7rw2ES16ciYYwBZIOFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66377733"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="66377733"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 07:24:13 -0800
X-CSE-ConnectionGUID: hDE+VOrOT1qEYLpskW2jmw==
X-CSE-MsgGUID: V2SUczRqQcSrldLBEXqOTQ==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 07:24:09 -0800
Date: Sat, 29 Nov 2025 17:24:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 1/1] docs: Update documentation to avoid mentioning of
 kernel.h
Message-ID: <aSsQFjv5DK_7GS6P@smile.fi.intel.com>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
 <a731c794-1b4c-4ea7-9cf1-0210b95eaa4d@infradead.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a731c794-1b4c-4ea7-9cf1-0210b95eaa4d@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 04:26:04PM -0800, Randy Dunlap wrote:
> On 11/26/25 1:46 PM, Andy Shevchenko wrote:
> > For several years, and still ongoing, the kernel.h is being split
> > to smaller and narrow headers to avoid "including everything" approach
> > which is bad in many ways. Since that, documentation missed a few
> > required updates to align with that work. Do it here.
> > 
> > Note, language translations are left untouched and if anybody willing
> > to help, please provide path(es) based on the updated English variant.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks, Randy!

Jonathan, please apply this change. Independently on the opinions about
kernel.h the documentation has to be updated as it's currently misleading.

-- 
With Best Regards,
Andy Shevchenko


