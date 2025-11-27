Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716EF24886A;
	Thu, 27 Nov 2025 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764267559; cv=none; b=QJGaOFC+cEMKKSpxqKPbuRdqMehV3+eFfYe/sxuLl4qN173MuSl7AWPfwOaDi8uDUGgei7D1WWn7XG6bGiTIaX4HQozrq5OB2m5eBDp4oQfJhYMhEJPVkCzkSmV1WKZnWH1HLiu43ZyZuJogY9OxJuubeZ0xmIisqfj/N1bQexw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764267559; c=relaxed/simple;
	bh=9cNwbS1AvwqYOEYG2PuxVy181ETfgtTrqfsvVp6erkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyQ+JfaXBtZrtMsBJD9D9YVFEuo+VMgH6C79QanEvAoq2iRe12d3P27bGdzMV3x63yh2M1Y3ILm75+OgQPBrYODfRiq89Wk6HSmTYfZY3i8erzsG0jNL/pFsxk/VCeNEfNmcJeBm8nHHYJm7qKgI0JcZA4K5lQN8Lp1DgUBDuMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dgs19kBx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dgs19kBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764267558; x=1795803558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9cNwbS1AvwqYOEYG2PuxVy181ETfgtTrqfsvVp6erkc=;
  b=Dgs19kBxh40yCsdSNOhYlUGOiAYVb4PAIcxnxysx+hWTrCX+uZep0oNK
   gI1I5kLVP4Lg473yDsCpikCnuTHxcnuJF4cRvK6dtwmpJ/jVQhEIrXa/t
   5F8mIERPzenvFJUDyI+l/29hGSo22sLrYY8uccr1hmLFk6xUvwo+o8Hz3
   QcA+/d4hJy97hIMJUE3KVdyrZZnuP0pOdGheE8aE+kPUtGFMlON24MOaQ
   OkRHOCF7vmcOzoSCoY34+GtoAyfnVBx1WaDqumYclUui0E00ZPBPSMP7f
   AkNshMc4vZf9Ucdx+HFFFQWZKOxS/qV67Zq2HlKTzAUfFmNone0Jur3SU
   w==;
X-CSE-ConnectionGUID: 0HoEGzlBTy6EIrcZExoi8A==
X-CSE-MsgGUID: cIiK+DyJTzWKZojfjjjAsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="68910419"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="68910419"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 10:19:17 -0800
X-CSE-ConnectionGUID: fQjdMJPjTgayXetdSqEWRg==
X-CSE-MsgGUID: 6ojDT/R4SmKnvPotBiF8iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="198239193"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 10:19:13 -0800
Date: Thu, 27 Nov 2025 20:19:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joe Perches <joe@perches.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 1/1] docs: Update documentation to avoid mentioning of
 kernel.h
Message-ID: <aSiWH1XPnlVZYLXz@smile.fi.intel.com>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
 <0fe4a563da5316ef702d7c324d0820c8c2c224e7.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fe4a563da5316ef702d7c324d0820c8c2c224e7.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 27, 2025 at 09:34:51AM -0800, Joe Perches wrote:
> On Wed, 2025-11-26 at 22:46 +0100, Andy Shevchenko wrote:
> > For several years, and still ongoing, the kernel.h is being split
> > to smaller and narrow headers to avoid "including everything" approach
> > which is bad in many ways.
> 
> And I still think precompiled headers can be beneficial to
> standardize using kernel.h to reduce overall compilation time.

Same Q, why don't we have just a single header? Why do we have a concept of
(modular) headers to begin with? And Ingo's approach shows that the problem
can be solved properly by dividing headers to be more logical smaller pieces.
So, I have a strong disagreement for using kernel.h. At least not in this form,
It needs to be cleaned up and some sanity given to that train wreck. When it's
done, we can think of precompiled headers.

-- 
With Best Regards,
Andy Shevchenko


