Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBA83FBEB9
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727419; cv=none; b=nByTm1Qms8o1cWeziS4im43AftsKsgsANGRkFo0hcRNX3LufH+BI4qaQbz/AVZaEIA+NT7hdGiIJhq3v0xkqnemq+84qmtQRTAFMoJj4iBQpet38UdybaKNdG2yjPwAkRsIC0UF75Lp/6ZDilVVCReufXEKaCMjrKgnc1IUeevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727419; c=relaxed/simple;
	bh=S9oewPD5KGae5HcFjUetqQBJ4wpwcMp0LSlhnfH7KCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtnGmJoSy6WGXjrdgFR0p+mDiaxwOjD8lQpiuKCrhlDmC4t7YxLJ3vSuRfnQvQsegxHCTs4K/eZxLqmiUFyENvdzOvduEqOEh8HVT+7FPH4R5hf7S+BS3tBXVxGCJa0gLLDVXh0msVJhStbggOoNnunWmbJjYMj6YF29u+ySE8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FRk66QTB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FRk66QTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2B0V
	N+5r8iusgnu733VSe+8cjXcjm/fgii3cqlMfGjc=; b=FRk66QTBKQJ3JMy+8jYC
	jw+7NUjyvGeim4e5Q0CcQlYMI56XNcXhuike3AMSgR2dxFRAOqojaGUKheZf3rrb
	XGgXEcZr2AtBoI+h6gQKpsOQzJdFLL/utT+Hi0Su/zlrKplesHWsrlOrW68wEScX
	fNvWhl8tl29IdTdzrZov8Pp5OqyjImLMCMJems6rhrwsAcw1W/WIlM9DC/aHLXjS
	xDJnyT/nH4t8KMYoRVrAOOgOWlNdZnzM2jwCrNZBgVBa0dUxfzXJlE9kn+xQnkM7
	PY0xi3fJOgAbET+TIzVPcnHP1nUiP+kpOKucbaYzSd1Hn7sBwlT8gJ8PAwaeqbuq
	DA==
Received: (qmail 329910 invoked from network); 29 Jun 2026 12:03:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 12:03:34 +0200
X-UD-Smtp-Session: l3s3148p1@FGRDkmFVsMYujntC
Date: Mon, 29 Jun 2026 12:03:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <akJC9pD2b5GQbB0u@ninjato>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <ajk_u7TVT-kL8z2A@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajk_u7TVT-kL8z2A@casper.infradead.org>


> The hwspinlock_tree_lock is not needed as the
> spinlock built into the XArray is sufficient for all these cases.

Are you sure about this?

In hwspin_lock_request_specific(), the spinlock is taken, then:

hwspin_lock_request_specific()

-> __hwspin_lock_request()
  -> pm_runtime_get_sync()
    -> __pm_runtime_resume()

This starts with:

	might_sleep_if(!(rpmflags & RPM_ASYNC) && !dev->power.irq_safe &&
			dev->power.runtime_status != RPM_ACTIVE);

Isn't this a problem?

