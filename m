Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63622264CF;
	Wed, 26 Nov 2025 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193195; cv=none; b=iFmFLL5MEfHRMYZPG5C/7tiY/NQxO49hB6rZUaXdbyh3U9zc44UmLAXHVF1jokjukFSqtIscKTq1GwJICBUR+3Bo3gKmmHl0w6x8tjuFqlE93juI2FzS2M6c2AapDDsoq4iuq/alO+kfhAEP9BSDWfOHiyEF1RTEHVjzPVYnpZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193195; c=relaxed/simple;
	bh=8NTiV2rQcwhyce8b6uCD7ruQAWe8QkSMDz34DqE/Dnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YL9JBQRsb1JCkCDKhtkoaVsZ72sY/YNDeopNjM3qpxdLJWrfCTz1FMHdB1ywwytie4PYqMh/FPdMPVxFa3ka06WAL020T2l3UFuGY3sqKzvU7dvns5u1NZ8bn1xLIiV73cAzO8cBIUC5mTJqqwEvnqyk301+djKt6R4KcYLRn3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNmRDcL+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNmRDcL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764193193; x=1795729193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8NTiV2rQcwhyce8b6uCD7ruQAWe8QkSMDz34DqE/Dnk=;
  b=TNmRDcL+w7SqAyeW49pH6MApNNTVnDv1kekSu60UO+ABJeQfXbIOoigL
   zPAkPdh98Z8EnPEiQ6hzmcUQzE7oI8Y0Q29f2PWwaeyptu8A3/L/Rgb5c
   q3/y3mBw6tTKEK8cinJ/b6SlcHVTzMhsUrdF9dOsSszblLlt16DVK+aKI
   y8erpOzi2N04tI4JnWOCpka+D+TAmZsmzXEGhcszow+Gwig9pHQTm2xAn
   XDgVbmCTwXi5+Roea2FqKLKooThtoc9fsbM07v1AKbjaGKycUGINOjIwH
   8aG7quA2BV9l+YOIWvpR+SFsB+WVzfMiYctgXTEYjU4Yj8G/19Cg8cKuE
   A==;
X-CSE-ConnectionGUID: HSyAQu9nQH6p6BjMM5MLTg==
X-CSE-MsgGUID: yP6PUHZ6SmyhSN6txU1YnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76868882"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76868882"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:39:52 -0800
X-CSE-ConnectionGUID: djwRMfC4SwuB+e58h+Oe5Q==
X-CSE-MsgGUID: jrU4nSUyQHSfGz3FqWoS2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192304229"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:39:49 -0800
Date: Wed, 26 Nov 2025 23:39:47 +0200
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
Message-ID: <aSdzo8aOns_3oPQA@smile.fi.intel.com>
References: <20251126205939.2321498-1-andriy.shevchenko@linux.intel.com>
 <e5ca4be6-6919-4855-bb7f-bd36761eab0f@infradead.org>
 <aSdwIN6qA-66hYhm@smile.fi.intel.com>
 <8d68b0b7-ee9e-4121-aa85-19fbf8470fdc@infradead.org>
 <aSdzHqxI-iDsksao@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSdzHqxI-iDsksao@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 11:37:40PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 26, 2025 at 01:33:13PM -0800, Randy Dunlap wrote:
> > On 11/26/25 1:24 PM, Andy Shevchenko wrote:
> > > On Wed, Nov 26, 2025 at 01:18:29PM -0800, Randy Dunlap wrote:
> > >> On 11/26/25 12:59 PM, Andy Shevchenko wrote:

...

> > >>> -The header file include/linux/kernel.h contains a number of macros that
> > >>> +There many header files in include/linux/ that contain a number of macros that
> > >>
> > >>    There are many
> > >>
> > >>>  you should use, rather than explicitly coding some variant of them yourself.
> > >>>  For example, if you need to calculate the length of an array, take advantage
> > >>>  of the macro
> > >>
> > >> Otherwise LGTM. Thanks.
> > >>
> > >> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> > > 
> > > Thanks!
> > > 
> > > Can you also test it? I hope it will be not so broken (as some of the files
> > > seems never were before in the generated docs).
> > 
> > It's not completely happy:
> 
> A-ha, thanks for trying!
> 
> > linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:125: ERROR: Unexpected indentation. [docutils]
> > linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:123: WARNING: Inline emphasis start-string without end-string. [docutils]
> > linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:126: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> > linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:130: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> 
> 
> I will look at it tomorrow, but can you remove this (or even fix) and check the
> rest meanwhile?

At glance seems like colon is missing, should be :: instead of : in near lines.

-- 
With Best Regards,
Andy Shevchenko


