Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A635814AD0D;
	Sun, 28 Dec 2025 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766944929; cv=none; b=ss43lbAReZzDJaXM7ZL6rD1HJkUUoviUOTS3f1Dkdp9lZ6yL7aF3fN7WCsqacUQnj2IcYjCNsYw14YEB+bTEeK0CcMjYjpZZgftXOZmV+adAA4SvIhO/jVUx6uBBtmqxBt+hHbwaR+pQ+R9bDwv3+v6Uf6MrYpcNfXoQlSYCxL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766944929; c=relaxed/simple;
	bh=24k0BnsCKXgnHXVfTrewMI2jgj1eEM+qK6zvfESC60k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJOZV4GjX5bkhYqmM03Ln2LO377ROAPaJN28371tYQrEHaQh0KQu970E+vIWxOQMPcUhj6TIYrNZMi2ORIF3hs6UIRxz2puRhX3AdEPsgo/+DN4MitQ1qxhgSn98Q7KTuhrWWDSAndnChwi+GdZs020Kl7jGfao7Gy/TR9QfPVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehvUn2uO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehvUn2uO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766944928; x=1798480928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=24k0BnsCKXgnHXVfTrewMI2jgj1eEM+qK6zvfESC60k=;
  b=ehvUn2uOw1zBohfBdARAolgWtnogh4jQk1rZAlOUt1CEZzDErdSusj4U
   NsXbgVqp08JGpVK3eoMMx2rICm4GgfB3cyAtdAKbewTCv3Y9yVg44sC5G
   Ujm6g4qEBHMUQlat7+BaJoRigqQS6hTMxv5jzp7G3u1Kn9H7CjPLf2s0O
   lsl7A9o+9gjE4tQVSpijsgvoz+NFn+PYKPlyMC2c1oO5+vXiDAPAMfSfQ
   1p7lJ77FywmZy9lQoEJM214hfx1hXZNMCuEmz1AL/eZWportCCFw99b07
   wsvB6EQu98D2vvHD5QDKiR5uHR4EYMotS3Yy8GQgPReFrroUD2U+AVMmg
   A==;
X-CSE-ConnectionGUID: uQwjFknLTwmoC9Qog0mPMw==
X-CSE-MsgGUID: 0gSPK/+mQTi2gJf3ouH4rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68473091"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="68473091"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:02:07 -0800
X-CSE-ConnectionGUID: 50n7WvsHRK23kcrKBXfGqA==
X-CSE-MsgGUID: BKQDxl3wQ9iLwp9jpRiLqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="200382744"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:02:03 -0800
Date: Sun, 28 Dec 2025 20:02:01 +0200
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
Message-ID: <aVFwmfInXYL_ZByA@smile.fi.intel.com>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
 <87fr9218jr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fr9218jr.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 22, 2025 at 03:00:24PM -0700, Jonathan Corbet wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> 
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
> > ---
> >
> > v2: collected tag (Randy), fixed util_macros k-doc (Randy, me), fixed spelling (Randy)
> >
> >  Documentation/core-api/kobject.rst              |  2 +-
> >  Documentation/dev-tools/checkpatch.rst          |  2 +-
> >  Documentation/driver-api/basics.rst             | 17 ++++++++++++++++-
> >  .../driver-api/driver-model/design-patterns.rst |  2 +-
> >  Documentation/process/coding-style.rst          | 10 +++++++---
> >  Documentation/staging/rpmsg.rst                 |  7 +++++--
> >  include/linux/util_macros.h                     |  2 +-
> >  7 files changed, 32 insertions(+), 10 deletions(-)
> 
> Applied (finally) thanks.

Thank you! I leave the translations to the respective maintainers and native
speakers to decide.

-- 
With Best Regards,
Andy Shevchenko


