Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5836441C62;
	Sat, 29 Nov 2025 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764438368; cv=none; b=Xun6OZ3Pyr+59mJqgbN+sYckVwmnsVpPD91NsmzGN97rtRs3gN4lduOhjNWj+N7Rku65T/uF8kC8kNvoQs7mjICIom4JLEHbnwNi0plircQS0hNwcgQlLuD3U9oyjN4gQgnXZxTgE+cEumaUC2+88YGJSPjcBsTGPNucx9WUNJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764438368; c=relaxed/simple;
	bh=sG7xAvmeT/U78VJU2jq/8MBPk1NtPrKbbtxcHJpuZi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfh6pL31h1cORByydPbB8AOZb752IaJKip035Ka+g6a6QaST9CpMMlnToKHEaPULBpUpt7RbdwlY9N2T5zvqx1JkYLSXyMM/tDzTPhAYsuDbleHpZ08szGStIb2S3sPZ+Nd1TaVisoaM8bMl84b/mIvquDxF3YScRyG+qbCSeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsuQa2Kc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsuQa2Kc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764438366; x=1795974366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sG7xAvmeT/U78VJU2jq/8MBPk1NtPrKbbtxcHJpuZi4=;
  b=HsuQa2Kcf4PfrFAi8FM2JxKiGp2qdPbpgCTOFo72n4dgH4bU9X/uK6yE
   /xoDR6iV22Jp2/Qv3vdDRzXkHCnYvNeGlBbJkbwOH+O3yfJDR2PpU9mOu
   AnLZTD5FphtO0VZV3s1ajQNPrxAx1/nszpdd5WNLafSfTP23pW/u0Qz6u
   XyRbLYjOy9jmUBcA6LZ3i6tqXTh/6zNN1yaEQZcSJ7QoMzo6Ip1COl0RL
   1BDBVzElYiggnQh0ghrmFZDPRDNgq7oLPXo7j/rXyqUuHrjQMJuSpkM89
   v9/djO/nENW+STLtpKPn3GgyuwMWxy/VE0HWmx5SS0288unPvCVHPtwiU
   g==;
X-CSE-ConnectionGUID: rLvQm+FLR7SjP2X0SKmYPA==
X-CSE-MsgGUID: dZG+/s78SuKVO93/CHmmyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="77058658"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="77058658"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 09:46:05 -0800
X-CSE-ConnectionGUID: Xix+YeQ/Rmeva456Cx2KDQ==
X-CSE-MsgGUID: MwSz+Sy9SYWRxjv3Ph7wFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="193594079"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 09:46:02 -0800
Date: Sat, 29 Nov 2025 19:46:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 1/1] docs: Update documentation to avoid mentioning of
 kernel.h
Message-ID: <aSsxWIdMqYtiEugU@smile.fi.intel.com>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
 <a731c794-1b4c-4ea7-9cf1-0210b95eaa4d@infradead.org>
 <aSsQFjv5DK_7GS6P@smile.fi.intel.com>
 <87wm38vnp3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wm38vnp3.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 29, 2025 at 08:54:48AM -0700, Jonathan Corbet wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> > On Wed, Nov 26, 2025 at 04:26:04PM -0800, Randy Dunlap wrote:
> >> On 11/26/25 1:46 PM, Andy Shevchenko wrote:
> >> > For several years, and still ongoing, the kernel.h is being split
> >> > to smaller and narrow headers to avoid "including everything" approach
> >> > which is bad in many ways. Since that, documentation missed a few
> >> > required updates to align with that work. Do it here.
> >> > 
> >> > Note, language translations are left untouched and if anybody willing
> >> > to help, please provide path(es) based on the updated English variant.
> >> > 
> >> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> >> 
> >> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> >
> > Thanks, Randy!
> >
> > Jonathan, please apply this change. Independently on the opinions about
> > kernel.h the documentation has to be updated as it's currently misleading.
> 
> I will but not right away...I'm really trying to stabilize things,
> already too late, for the merge window.

Noted, thanks for explanation!

-- 
With Best Regards,
Andy Shevchenko


