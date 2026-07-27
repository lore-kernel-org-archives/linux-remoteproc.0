Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD813F9F28
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148563; cv=none; b=qQpEH5mL+q9jD0cmcwShhJmLr4dBuviItk5tfhI8B0lKNLmFmHy6IK5vXdzMvwShlNEC6Un7XNEeLhZvLq8J1VZIYmU+6uUK/L+nK7kLLtLUubk5j+bkweDkD57zMNar7+1lV+vX8wi3xReljmqIH/C1n+IYpmP//Sc/8PjLBS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148563; c=relaxed/simple;
	bh=gphXbGpvguzsklytuvq2iLvyioRGL/gt+2acwRCGbik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqycE4bNWBrxOS0uJ1d1Uras4AzPKrX8MYi8V7srlg6s1LcI6UxPoV9KKKhdEr1TwoRU/YQBh9WOPpCMseSnF6onR3FbKARFuCHjnO1geDTkqNJinX5+Vs9Zbp8WLUpbqFnEhr/w3D1YU7MgYX2KkU2VPYeEokYP3FN3/fRH5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AyqcU/bd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AyqcU/bd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gphX
	bGpvguzsklytuvq2iLvyioRGL/gt+2acwRCGbik=; b=AyqcU/bdBXK0cVxzeI9V
	l4dujALf5tJ39FhghwcxFxjrKKUfyFln1mgALm1MbokXnHzP6aw0CON3Mnc8fB50
	h8Ay6S8z7vXFnH6Ici5RpWGobEWEYlj6WIu2s2/1+s4A0gy92/2FskZ/Z0LbfUXi
	HF/Fnb3ADg4EfaeYTwkcdKH0oLLOHNqm7oAX27Qwea7nz+vTvux8/ZTglYwJ4+Dn
	Te+FUNPXhdyyVzNsD0in0ccDVyyOEEwLQ9Q2XmsZGhtqWgQq9MtNFqBwsha66SWQ
	bUWOJHJ/YB02K9xgwz3qtnn42jBMEq6WTYm8VxNWuaG6SHGdLeZcK6i3FcrCvUGg
	gw==
Received: (qmail 572776 invoked from network); 27 Jul 2026 12:35:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jul 2026 12:35:57 +0200
X-UD-Smtp-Session: l3s3148p1@ARWjSZVXMOkujnuy
Date: Mon, 27 Jul 2026 12:35:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v6 0/3] hwspinlock: convert to XArray and add debug
 capabilities
Message-ID: <amc0jR2yH3ia6ZgZ@ninjato>
References: <20260727100559.3119-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727100559.3119-5-wsa+renesas@sang-engineering.com>

On Mon, Jul 27, 2026 at 12:05:58PM +0200, Wolfram Sang wrote:
> Changes since v5 in the individual patches. Nothing high-level, though.

So, all of the remaining Sashiko reports deal with unbinding. This is
already completely broken in the subsystem[1] and I want to tackle it as
a whole with my next series.

From my side, this series is good to go. Looking forward to other
comments, of course!

[1] https://lkml.iu.edu/2605.1/07475.html

