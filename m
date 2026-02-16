Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4193054C7
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230554; cv=none; b=Wx9sk3ejsMn3+nehcl4WJO4dhjaFgW6abFoQprQ6l0sMR+Edfxgbsf2hkq6QPkr/3tEYXyiVDg0SvVCUmP6DBPUoyrxg9n/po9F2UkEeFIs5RHR0rcJU4ZqEmVZYvHeoXe94n1JLPRNCLDwvQxTQ5qYvAHBWtF5cLs2eGAHTZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230554; c=relaxed/simple;
	bh=mTBsAANyzCgZrfUjL0K8fMktL3GqkfQK6Lu6uNMTep8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoW908XYp9BqU8n+URgNZiyRyKpbLBZ3jV7zPjMZ8M6dtgJEWO66b/gGf1NJxKNxIcwnlVtgrUkvAGhojIuc+JmbvUadd7N24k5V8tBIXygRYXKBFYzwTHorLJfecdAda8u0X2zz7fSrgwkjkGNYq25BGspqmhe2v6yv33belko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=amzlBXRg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="amzlBXRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5SX/
	d54PXDjewqxCGR18EtEsbX5HuHmXdDmZUtDAJKY=; b=amzlBXRg6ZSAHSuMwTK9
	fxzgQIr3ynoNeTpGYNEXubCW5Wi73ac6vU3LhKIl2+M2hard43Sl85cN5S95SR+D
	i1Z3J4ZR75SjEt+M+lSQbltf6/PsMlBltEfxAgnmXWnDY6PsGim6jK7QjEi3NQZZ
	WABZhMOCYalNPqAewYTbjLYK6a/ErIi89LTwUvur7Dlul5qbsYMFvxx706WkSzQq
	Hi+npE0Qpte9x7ho6NPYQ/SQdOos+iA25htIvjHEXdTa/DpAuELe8O6oV7NrtG2o
	s4pomPV4qsDjsTdc8SzTGY/Mg/2/p/Jfk1qBo+IM2mtYCc88jhCKkCzCSxRzniRT
	Hg==
Received: (qmail 3162847 invoked from network); 16 Feb 2026 09:29:07 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Feb 2026 09:29:07 +0100
X-UD-Smtp-Session: l3s3148p1@ObiYv+xK2JYujnu0
Date: Mon, 16 Feb 2026 09:29:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-renesas-soc@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
Message-ID: <aZLVU9toZRX2vKX7@ninjato>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
 <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>


>    Don't you break the existing users of this API with this change? I see
> you're fixing them up in the followup patches but that's not how it should
> be done -- the compilation shouldn't be broken...

I am not breaking them. The helper is an additional feature and the old
way still works until patch 8. Until then, all users are converted.

I built tested it :)

