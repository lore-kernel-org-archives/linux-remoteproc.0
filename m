Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDE62868BD;
	Wed, 26 Nov 2025 21:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193062; cv=none; b=anDTB+BZrw/FLJ3AaLEJI7Colr6EFb3HWjvvguMP6EsfxUsUsbuWCrnUf0r4RQIOlubh5J71mhR5Fev6V0USMwjO0ChSMUC5j6LOg8SdIN8HAEhSTUAkvXeaPjLxtCRQoaFldpSxvGZ3gKkR4fywV/FCoYDkTSoTGuqpb2+UnBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193062; c=relaxed/simple;
	bh=JGzU4BimkQtzgHGrBg12JuT2gptSJI/LqneaM0BaHS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SatIgw+emTM4AVOeEfF2UxnvpRqjhXs23c93xaulvzVWa1vQHOElcaNMEfrabR/5M6msKp3bZsKSyh3dfBEcneFNgl5xyW2hz8cBJPCB8LpIqwl+BoZTMpI5hIxvzKb2F2dtMnUkeG3roOYw4gKS9oVc6E5SDUsGzns4LfbGYQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pc2LkZ4k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pc2LkZ4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764193061; x=1795729061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JGzU4BimkQtzgHGrBg12JuT2gptSJI/LqneaM0BaHS0=;
  b=Pc2LkZ4kJR8n3Vubjj2Y7xDfwzmDhSTXVLX/U4aAI2Doc+RE015su6GR
   VfaefKycYhA1uDRCDpZWxUyyjBYx/e7bGWwmis99OVhFlotUmVqO8Qfqy
   EwqGf47AED+mrotkCEgQkaWrb98gH8BszPZVGv4d2yzAs8WuWBOVDYVk/
   RNPUigZTS3kgKQb4u3loQFvh2MOg22L0PXLEh7DlRQuXWbDkCVA/A0U1v
   XWF8fDgCmSiPEDW+2UJR1QY7ZD3UjVE/14M0ZBZYzGbgMeRH95DVKFM7v
   kz5Nmv4Lj+27Xglz4/e0nK1wrn6/CQkX9QZMoslz+hM7y7sszi/PiChwy
   A==;
X-CSE-ConnectionGUID: 4yP/MpfVR16a+BblrlsrSQ==
X-CSE-MsgGUID: ht5JjJ+gR4yp19nKmrz23w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66185871"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66185871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:37:40 -0800
X-CSE-ConnectionGUID: SVnEWGDOQPWO3xEVenJFQw==
X-CSE-MsgGUID: NUv8NzqiRSKzwM7RAsNEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="223763134"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:37:36 -0800
Date: Wed, 26 Nov 2025 23:37:34 +0200
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
Message-ID: <aSdzHqxI-iDsksao@smile.fi.intel.com>
References: <20251126205939.2321498-1-andriy.shevchenko@linux.intel.com>
 <e5ca4be6-6919-4855-bb7f-bd36761eab0f@infradead.org>
 <aSdwIN6qA-66hYhm@smile.fi.intel.com>
 <8d68b0b7-ee9e-4121-aa85-19fbf8470fdc@infradead.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d68b0b7-ee9e-4121-aa85-19fbf8470fdc@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 01:33:13PM -0800, Randy Dunlap wrote:
> On 11/26/25 1:24 PM, Andy Shevchenko wrote:
> > On Wed, Nov 26, 2025 at 01:18:29PM -0800, Randy Dunlap wrote:
> >> On 11/26/25 12:59 PM, Andy Shevchenko wrote:

...

> >>> -The header file include/linux/kernel.h contains a number of macros that
> >>> +There many header files in include/linux/ that contain a number of macros that
> >>
> >>    There are many
> >>
> >>>  you should use, rather than explicitly coding some variant of them yourself.
> >>>  For example, if you need to calculate the length of an array, take advantage
> >>>  of the macro
> >>
> >> Otherwise LGTM. Thanks.
> >>
> >> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> > 
> > Thanks!
> > 
> > Can you also test it? I hope it will be not so broken (as some of the files
> > seems never were before in the generated docs).
> 
> It's not completely happy:

A-ha, thanks for trying!

> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:125: ERROR: Unexpected indentation. [docutils]
> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:123: WARNING: Inline emphasis start-string without end-string. [docutils]
> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:126: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:130: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]


I will look at it tomorrow, but can you remove this (or even fix) and check the
rest meanwhile?

-- 
With Best Regards,
Andy Shevchenko


