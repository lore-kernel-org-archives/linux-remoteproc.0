Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58D812B93;
	Wed, 26 Nov 2025 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764192296; cv=none; b=rR2oo7bF2jsJ/kBtMgMeMeuslZmNkpM8iLbTETmy+oFXHPCEq+k757SHYLvCudTuyVcp+w93choxQKdS0gKb8SEisp9Zd5k0SVz4bISXWfDeGDPcgLsE2UfBUwcljcIpwFD+dhfp20PeCkLv3MaKo8A04ED0sM38DROVs1DZmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764192296; c=relaxed/simple;
	bh=AjhRZ85s9z+ZyGqKnInIoBL7dEFtynHaO9n5AAbKTRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iElsu4NgDT63XcEQEcsM3sFhWFgrndVoCl/CQt4BKMi4uP2+QAecubfthFe8nEBepTTJ2NivEt5HuP19qjqT5QNH/oLVc9+SqD3ARmd4kp6s7y+Jb7c1CdqoVJrImEyw891Dj5wVsOyfj5V5uVBC43u9glAkn8jOoP07aRqrd18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgrturBY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgrturBY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764192295; x=1795728295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AjhRZ85s9z+ZyGqKnInIoBL7dEFtynHaO9n5AAbKTRc=;
  b=cgrturBYid/Na2ko0A1B67IbdV3pTG736Xb4xaCrtAvbMpqWHkF/GUoV
   03NcSM+UJ2/IEb7iNsEANFVepo4OXmUf7hEP6iNlm66Sp6gkvllcll3Il
   Tp1O4iigoX1tsBMdBiOKQBT4CHwu2FIz/+533XS4Sfa+uUgabb7ArQPHP
   EEDEMfBCBTeAyPL2tAkV22Z5hVcYTHx3/NaAJlpsQW06u/5V36+zH4qMr
   WDdh1+1eZZaZWIp+8XBpRvth8kRSp059RnNyiZUZLC6ntWqAf2S0wvBgl
   HjAlRIHGzZt2xc8wFu3xy9EUj7boUmKVygRKf1Yxz5Lmgt/LfvsbrB/LO
   g==;
X-CSE-ConnectionGUID: ESri8MB9TsSrwLxXSj42iA==
X-CSE-MsgGUID: EuEQm0O+T/uivZEk/cPdOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65426310"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65426310"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:24:54 -0800
X-CSE-ConnectionGUID: yRfBQmL2R0u0glMI7lTH4w==
X-CSE-MsgGUID: H/Ch56jIQByWNGczSEbAtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193858292"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:24:50 -0800
Date: Wed, 26 Nov 2025 23:24:48 +0200
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
Subject: Re: [PATCH v1 1/1] docs: Update documentation to avoid mentioning of
 kernel.h
Message-ID: <aSdwIN6qA-66hYhm@smile.fi.intel.com>
References: <20251126205939.2321498-1-andriy.shevchenko@linux.intel.com>
 <e5ca4be6-6919-4855-bb7f-bd36761eab0f@infradead.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5ca4be6-6919-4855-bb7f-bd36761eab0f@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 01:18:29PM -0800, Randy Dunlap wrote:
> On 11/26/25 12:59 PM, Andy Shevchenko wrote:

...

> > -The header file include/linux/kernel.h contains a number of macros that
> > +There many header files in include/linux/ that contain a number of macros that
> 
>    There are many
> 
> >  you should use, rather than explicitly coding some variant of them yourself.
> >  For example, if you need to calculate the length of an array, take advantage
> >  of the macro
> 
> Otherwise LGTM. Thanks.
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks!

Can you also test it? I hope it will be not so broken (as some of the files
seems never were before in the generated docs).

-- 
With Best Regards,
Andy Shevchenko


