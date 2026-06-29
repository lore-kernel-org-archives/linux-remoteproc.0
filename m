Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD632F872
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724025; cv=none; b=R5gjoyy2HJieHayYbRhI3ozIcuDK9IreUrgcaTjw7N1IrrlPiOEARwuapF9gU8KX9MIaNTKyO8ejogA4YA0xVEBBtsfL7rATIRdbQXWU+n1z95kERWR7R7Hrt4enbP6zSYmY8rJB+rOhYIfHar5mUzGWJgZnweH4xuIda4sddoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724025; c=relaxed/simple;
	bh=hwGq5vvBEQS7g1MnAVw3grcl208Dw7MxaJ6Fg7s90IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lM1pQKlljb9pHDDmPkL2Ao129B5t1x+DeQU6uleVAa0pWJC94++QLeS/lCIpVO4pOk9W5VwgHiXWJugg8AUz0Fg4wo3Am+mSjYrjH4EZm2VIwxlHbKrul4ph8t2ZEFI9WQqSPfCVyhDsIjPpFMycob4v029P3K/oTiKe3HltR20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AXDGbT8i; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AXDGbT8i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hwGq
	5vvBEQS7g1MnAVw3grcl208Dw7MxaJ6Fg7s90IE=; b=AXDGbT8il2QBjcvj5pV7
	MDdBWKLzQ2+hSTKQS3g3YJxS8HYIdo8ysbfrjeFj7CFqWl/G3gVTQNgym5u7pXWa
	4NIHcPRxJKRf0UpshUB8CRkJ8nPjYMSbj7nFNMmU7vCSATf8hiKDr/3CdjFLMAw7
	sZd60l08BeUtkc6FHUB8Q7EwuSLijzWZ5f4ooM1iNneT4UIsofxTYhYcY70Bz5xY
	uUhDktnr+zwftGmIrV/M23jcESqKXnbpZAGXLggtIs0QT5e5RXSdxAG8fxpZmRCY
	CKSRVl4ARN4HpjugdzLhUyqRuPkCc4fEB2VVjY9CEx+prBYhRen+B+9sESa/U7Lw
	4Q==
Received: (qmail 311221 invoked from network); 29 Jun 2026 11:07:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 11:07:01 +0200
X-UD-Smtp-Session: l3s3148p1@LXYEyGBVns0ujntC
Date: Mon, 29 Jun 2026 11:07:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 3/4] hwspinlock: annotate slot pointer as RCU sensitive
Message-ID: <akI1tYjNpErOQKzz@ninjato>
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

On Mon, Jun 22, 2026 at 10:52:02AM +0200, Wolfram Sang wrote:

> Because 'slot' is used within an RCU read-lock, it must not be accessed
> directly but with RCU helpers. Annotate the pointer to enforce checking
> this. Sparse confirms the missing annotation:

This patch will not be needed anymore thanks to Matthew's XArray
conversion coming with the next iteration.

