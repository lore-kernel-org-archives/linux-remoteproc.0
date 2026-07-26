Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBDB30F531
	for <linux-remoteproc@vger.kernel.org>; Sun, 26 Jul 2026 21:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785100858; cv=none; b=rvKONKR9gRVQxrXtILnQGwkFjr4t1Xd3Pe+fITQq4TycVHxaNZYPHrm7olkyllSRs5cfMAy0wa6MXVYj8JSQ8Qly/jSXdOegCn8SunVhqvp9v+vIBUsCsWLgaKD2sG8E9/hQ1Dvg+FtufKydPaC4uFSgr0fdBmdD3BafhLBhEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785100858; c=relaxed/simple;
	bh=VfPYyNXHmxZ2UO4d4eIODulK++tReTFaklYTZdUltPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5RLZDw4AYFH/c9Msi120jLtp9RtNS8GbzS8PkGoqxiCcrODFPbrY9Q+hDraZWEC/XkuuI7gUDpO2b+N99d+9YKUy9F+akbWkDUUnMDpPJcCZXAQ8Z8g9/P6pIqKM3l53VwudXktsfa3c8ObMAtl1pVXhNVZZGeZbzEW1CKwCoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VoPBzQZk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VoPBzQZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PAln
	gCv95oETr9YvCH8v21934nD/WjGORb1IPjKJrmA=; b=VoPBzQZkPL9GtK5q3GWp
	omqcHw5pP5LnxFshZXMDDQUPxvFSsujSDK/xdZNT3PTjyfsegNqzM6rJEL5rJqbD
	5j86bbsAD0FZEPE8MBS5NXkWIOP+o1KGijMhBHH0bc5KcRCgpilv7CH6R/aj/WAm
	NQxnS/NLnBPXhiW0km4P+jcWLEtHpiz9jksZ9RODo2pPvwDT9YOEczxnW4cmKuA2
	s0sWDOzB9+C7yoHL7CenkptjQpclrLDJtWFUNGKXFqzMD4TkpnFkmUZkCVYdZ7Rt
	B/psiO17R/KAxuAoR+IBuIIyly3qO39DPOIIMdsTWCH/JmfWnEJGIZ2D4SBN1GRb
	5w==
Received: (qmail 380658 invoked from network); 26 Jul 2026 23:20:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2026 23:20:54 +0200
X-UD-Smtp-Session: l3s3148p1@8OZNLopXDLUujnsw
Date: Sun, 26 Jul 2026 23:20:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] hwspinlock: add list of mailboxes to debugfs
Message-ID: <amZ6NlhFxn7Uaaww@ninjato>
References: <20260718163024.1726-1-wsa+renesas@sang-engineering.com>
 <20260718163024.1726-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718163024.1726-3-wsa+renesas@sang-engineering.com>


> [Severity: High]
> This isn't a bug introduced by this patch, but this debugfs addition exposes
> a pre-existing lifetime issue with hwspinlock devices.
> 
> Can a concurrent device unbind cause a use-after-free here?

My next hwspinlock series will tackle the plenty of UAF issues.

