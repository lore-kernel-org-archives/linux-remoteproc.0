Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107C523ABA9;
	Wed, 26 Nov 2025 21:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193751; cv=none; b=RxlSCDCBPPiQyeTX6V1McmO3G8J3OPhlAtJeXzQ0w6MBKUpVxB5bCKhzQY5+CFgMAU0r7HYI4vZSSxNkJmWi/WR3Im4eXYdhAnmB+akcUK+ATXvhnOO2uSeLZcfOJZYmrtbixQ3HFpd9BNqDR3imCql9j/fqcZ4sgesXcV8cIfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193751; c=relaxed/simple;
	bh=mi/2xHpvzyYky4ZfF1hDWzyPRqZuWA5058fupOoFYFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGnUyeFiMIF5Kb3LUdRKe0PksOPrTfPP+mhEBxTRlQFvl9scFQyOvOm2dNWLLPW4JY1X5jzI7EYVKufb3wrmi1DjRZY2oIvtHmfariR7fyX6LYkUm8z6DwqiSvFOGU0WWF1lYCR0nxBS9f7bkvBmb1Py0+ZTK0ytGnEpLfZQcow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBA8uVbG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBA8uVbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764193750; x=1795729750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mi/2xHpvzyYky4ZfF1hDWzyPRqZuWA5058fupOoFYFA=;
  b=PBA8uVbGvhzaBhhqCveghi6eIJSoq8o6FC4PZjQsEPoY92wRGrFaYjml
   qvP8ODBxkj6uMR5xCuBSKc0sd9iJzDQ1lFUSFnlwEp8rp6968MGjq5TXy
   wllidMnLgeW2yUfEh87v3o/cE0BcKxc+jxkpw0lLGcHr5HzKITAjaL3Tk
   9IcGFnH+x5NrpcCS6dfhPZzVYqAXM2pI4Mv/m/UP8n9o1Mbhy828zvNUS
   E1gsOVEMvmdqybDqY/+8W3rea1sq7ytD2AKFroNXgj6XdSUeDkC8ORYhU
   YiYaM9Cqe1Z0SxZGdA/Nu6UVDjwr4yR/Ee11Xh3Qs6g+Rlc82MnKJ15KH
   Q==;
X-CSE-ConnectionGUID: PMGdLA0VRIGRDaNf24e4Ag==
X-CSE-MsgGUID: 1G2pMnhUSeaUBt+1cwL53w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="88884864"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="88884864"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:49:09 -0800
X-CSE-ConnectionGUID: WiT8HZ8IT1CCbql+jkDjlg==
X-CSE-MsgGUID: vGrFt1TSTniyVaYk4frfRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="216408357"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:49:06 -0800
Date: Wed, 26 Nov 2025 23:49:04 +0200
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
Message-ID: <aSd10BubWcoE18uf@smile.fi.intel.com>
References: <20251126205939.2321498-1-andriy.shevchenko@linux.intel.com>
 <e5ca4be6-6919-4855-bb7f-bd36761eab0f@infradead.org>
 <aSdwIN6qA-66hYhm@smile.fi.intel.com>
 <8d68b0b7-ee9e-4121-aa85-19fbf8470fdc@infradead.org>
 <9e0b0711-b558-4f58-9f6a-3463cbc50669@infradead.org>
 <aSd0SvaYlIX1HElt@smile.fi.intel.com>
 <cf6fa77c-3fe3-4262-96e4-f2cc79d6abb5@infradead.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf6fa77c-3fe3-4262-96e4-f2cc79d6abb5@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 01:46:05PM -0800, Randy Dunlap wrote:
> On 11/26/25 1:42 PM, Andy Shevchenko wrote:

...

> > Since it's like this, I just fix both places you pointed out and issue a v2.
> > May I have ypour Tested-by ten?
> 
> Yes.
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks, but I have just sent it out, please reply there.


-- 
With Best Regards,
Andy Shevchenko


