Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3741A304BAB;
	Wed, 26 Nov 2025 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193363; cv=none; b=RLCHU0w7IwAgA5EDxsX4uyZ4jOAYcCHkPoZQHacfza9WGRr4+HFwHCG7GohdI3xoBYnuss58BANNc9OZJgGRu6Wq4SaOwRf7tWrJxAHoFR+w3CLkTg0mUbgV6PdvmtFFtvBF1RdSJBzZBCHzRnwPUDAEmPBPrMvdmPiOubYc0Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193363; c=relaxed/simple;
	bh=QCM6BxhXAtOI4/AuNplc5Ve1s16Z+Nd6/rnbglLwuOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBVsxszvk9XsoxIaEmdFTjog5B77U+sTANibUUWZQWvX9Eq36Z9N/fvlyOyIwR4S/mFTeOegg4OF+lrpMedtHpIfFGvq1Vyq043hQEZhu1hhv7q4Oe8/lLmGRZ8m6UJuIVVsD/HnS+P03ZREXOVVZ3Z3rlJ5Xi/Oz4ZolyrF+cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmWrA0MM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmWrA0MM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764193361; x=1795729361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QCM6BxhXAtOI4/AuNplc5Ve1s16Z+Nd6/rnbglLwuOE=;
  b=PmWrA0MMgwQeVWTWlM4A6DfJTCuqtwRMMF/1MCjOXO6yvzAl9ZTqAvL9
   FTLptKRyKsafqqybPwJZOgrY1ZDI1Cjs9nf70ccIeX6SIXoASt+buQtC0
   Hrwpi+BZdUqhGzMZZ1R9s0KWfypkgpRQJZTm0zInpTzRTAocdel7lKrMh
   hUXbtiYVp8tL5EPC4x8tLf8rW9608syPn6WRBKkCq5xgQoMrqrdEeF9Q3
   8ZT02pWxhIAMcMTmA/Q9vuFWbORYXXxKqprz6lfnDqOxuLBnqivUyc1gz
   vm5OITTnaIM+TE/muKiz9mMbwxxMVvEYNWam2J3DiqlpNsc1llY9bXGf5
   g==;
X-CSE-ConnectionGUID: Ha60TstVRsqVdpVjD7vbMQ==
X-CSE-MsgGUID: 5Y6eOug7S3i+C44eKm9tfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65244202"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65244202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:42:40 -0800
X-CSE-ConnectionGUID: tpXh001fSk+HY4mOFBemSw==
X-CSE-MsgGUID: fku2WLa7T/2dWAJU3Wc4Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193078738"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:42:36 -0800
Date: Wed, 26 Nov 2025 23:42:34 +0200
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
Message-ID: <aSd0SvaYlIX1HElt@smile.fi.intel.com>
References: <20251126205939.2321498-1-andriy.shevchenko@linux.intel.com>
 <e5ca4be6-6919-4855-bb7f-bd36761eab0f@infradead.org>
 <aSdwIN6qA-66hYhm@smile.fi.intel.com>
 <8d68b0b7-ee9e-4121-aa85-19fbf8470fdc@infradead.org>
 <9e0b0711-b558-4f58-9f6a-3463cbc50669@infradead.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e0b0711-b558-4f58-9f6a-3463cbc50669@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 01:36:44PM -0800, Randy Dunlap wrote:
> On 11/26/25 1:33 PM, Randy Dunlap wrote:
> > On 11/26/25 1:24 PM, Andy Shevchenko wrote:
> >> On Wed, Nov 26, 2025 at 01:18:29PM -0800, Randy Dunlap wrote:
> >>> On 11/26/25 12:59 PM, Andy Shevchenko wrote:

...

> >>>> -The header file include/linux/kernel.h contains a number of macros that
> >>>> +There many header files in include/linux/ that contain a number of macros that
> >>>
> >>>    There are many
> >>>
> >>>>  you should use, rather than explicitly coding some variant of them yourself.
> >>>>  For example, if you need to calculate the length of an array, take advantage
> >>>>  of the macro
> >>>
> >>> Otherwise LGTM. Thanks.
> >>>
> >>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> >>
> >> Thanks!
> >>
> >> Can you also test it? I hope it will be not so broken (as some of the files
> >> seems never were before in the generated docs).
> > 
> > It's not completely happy:
> > 
> > linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:125: ERROR: Unexpected indentation. [docutils]
> > linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:123: WARNING: Inline emphasis start-string without end-string. [docutils]
> > linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:126: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> > linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:130: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> > 
> 
> This little change fixes it for me. Just include it in your patch, please.

Thanks, just 15 sec before your message I guessed the same fix.

> ---
>  include/linux/util_macros.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20251126.orig/include/linux/util_macros.h
> +++ linux-next-20251126/include/linux/util_macros.h
> @@ -119,7 +119,7 @@
>   * a fuss about it. This makes the programmer responsible for tagging
>   * the functions that can be garbage-collected.
>   *
> - * With the macro it is possible to write the following:
> + * With the macro it is possible to write the following::
>   *
>   *     static int foo_suspend(struct device *dev)
>   *     {

Since it's like this, I just fix both places you pointed out and issue a v2.
May I have ypour Tested-by ten?


-- 
With Best Regards,
Andy Shevchenko


