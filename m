Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5763A453B;
	Mon, 22 Jun 2026 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123666; cv=none; b=AfTdWQnFN9P2p2yQb6+AWoE7Ee0iSnVYVmIrq4p4MhmPbf1mB/w8Lb+iIFKpLpsArdfQxhA3yfo156p0XuaiD5kWUHYndmRhUQHezlg6F17C551iO2W/3cTet07oZTsf6awTjmbIDPJjaBuDeU6fFbOEjI0p/Gmzmd5cDdiXQzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123666; c=relaxed/simple;
	bh=IWQCVQHHiIA2w0XoObux1qcj0FaOJQdz8NB/8ZbxJXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgpdOHU0TUvOG85TcMnp/Cbh1pjg4KL3kvqXnMCHMcl0U/LHnSQH2Jcb+pEiAAEMw26OA0eVGBKD55ciHXJ/utfmeY8G7xkA3+wnunEy81ba0uTrLp+jrIR5aDc/vTgz20OJf5t1DD69T+aX2CHw3Am8NW16P4fccY/YXo8UMZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4s4TGoi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4s4TGoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782123665; x=1813659665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IWQCVQHHiIA2w0XoObux1qcj0FaOJQdz8NB/8ZbxJXM=;
  b=C4s4TGoixh7f3qz+lJnFbh8kJ0oNwpEe5GFy3rzulo1gbNkLWw4efX1z
   jfskUjTtJsDqfS0D76wL3i+HqpENSnBqOPjdY3P8olxRa6W3etYj+J7sg
   TJEQYqVdVqouetp65s/VcQhduzPXFSzYu/wD1RfVCuul880xuUI0RT1ck
   NYojPzso9wY/bFQa3J3LBzvHeDpNjDglKM9gepUMoemPhztOdqf8gKAgv
   Y5PxU8DF0Nvk0+dM2bvQrN5OpnXJqkjThny3KiaVTst5ZN3+CZX66Odsr
   2ADTLsuDKX+RWj3bF1SUJxP/3dRazYV2Px0N5CFU6U+e1vjtgAOUJYegz
   g==;
X-CSE-ConnectionGUID: LG3mmof7Q7+WuIGOih4Y0A==
X-CSE-MsgGUID: Q5bYMY6KSAy6JuSHy1EZwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86532348"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86532348"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:21:04 -0700
X-CSE-ConnectionGUID: wpUMOOBdTYWakM3/FYofnQ==
X-CSE-MsgGUID: nQeV4xGoTZa/T17Qd0g87Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="242832781"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:21:02 -0700
Date: Mon, 22 Jun 2026 13:20:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 3/4] hwspinlock: annotate slot pointer as RCU sensitive
Message-ID: <ajkMizlECO7fuUOb@ashevche-desk.local>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <20260622085204.54248-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622085204.54248-4-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 22, 2026 at 10:52:02AM +0200, Wolfram Sang wrote:
> Because 'slot' is used within an RCU read-lock, it must not be accessed
> directly but with RCU helpers. Annotate the pointer to enforce checking
> this. Sparse confirms the missing annotation:

Very good!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
> drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **
> drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
> drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **

^^^

> drivers/hwspinlock/hwspinlock_core.c:393:48: warning: incorrect type in argument 1 (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:393:48:    expected void [noderef] __rcu **slot
> drivers/hwspinlock/hwspinlock_core.c:393:48:    got void **slot
> drivers/hwspinlock/hwspinlock_core.c:397:30: warning: incorrect type in assignment (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:397:30:    expected void **slot
> drivers/hwspinlock/hwspinlock_core.c:397:30:    got void [noderef] __rcu **

> drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in argument 1 (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void [noderef] __rcu **slot
> drivers/hwspinlock/hwspinlock_core.c:392:9:    got void **slot
> drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
> drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **

^^^

No need to have dups per a couple of cases, though.

-- 
With Best Regards,
Andy Shevchenko


