Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506023BB108
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957387; cv=none; b=RCQ1R89CILFLhJY+e3/7qfmmwo381oZasmxiI68yiPf9N4QBYPcS7DvOJYYU1YSh7+UNhCAroN2ZhydPqJbFfdrcDPevF3vRI+fG4BNjErtk0WYF/DHOqMCljO8EVxpUAaQS2lFHpRERhtvmR7GA+wPPf1X694oTJ/ry7Gva1kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957387; c=relaxed/simple;
	bh=Ctm073Bj7e2ZLjn3SSoFUwpRQr+8cC9o7LCyjPJVWhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7YB12PY1JTD6Xqn+pDw89uDQk3Hv9dweutlgZxArDkkJiBUYvWdQ/zdS7oFbF8pkqeYkbSC6cM06M/+YrBrsg+obKpor4WbgW5z9b6KMv2A0rpXEzEyiQB/uf6uy68tMwWz7IkoJIbxKNTTJ2tQRAEyxHiaq9GIembYq0TnvEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DTt/QPWI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DTt/QPWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ctm0
	73Bj7e2ZLjn3SSoFUwpRQr+8cC9o7LCyjPJVWhE=; b=DTt/QPWIhPSB3YihO9GB
	0O5kcPgYoiKvE/qgOX36RrKgLnT2IF41Um/T3IKDxHQRYwHZqt4cmWPHIZiiQGqU
	TLYFN7uV+NuK73f6YxEeZhUJz2yTaxR0UsM5xwDMQ2aB8GFki59Ltv87MgjHp/lk
	tD/s+LDkrHiO93r0sHA7z6mRw87IrQf+y12/UA76QsWQiOERd0xv+8CH980kebje
	s5o+/U2FTmPpwXWDwFWnP9nXUdr6mEMwF7rX1lnL5Jp3bGpKeHHsoUjU7vnzB5Pn
	GFtnhOZgUvLhkodruP76X0dzJ1xaWfYtXLsC+vwLxLwx46fBmcXE30RhevJY9bc0
	wQ==
Received: (qmail 3396681 invoked from network); 17 Aug 2026 11:03:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Aug 2026 11:03:03 +0200
X-UD-Smtp-Session: l3s3148p1@zt4KcDpZ2Owujnve
Date: Mon, 17 Aug 2026 11:03:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v6 0/3] hwspinlock: convert to XArray and add debug
 capabilities
Message-ID: <aoLORmmx8OOSQwlZ@ninjato>
References: <20260727100559.3119-5-wsa+renesas@sang-engineering.com>
 <amc0jR2yH3ia6ZgZ@ninjato>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amc0jR2yH3ia6ZgZ@ninjato>


> From my side, this series is good to go. Looking forward to other
> comments, of course!

So, it seems this didn't make it into the 7.3 merge window. Anything
this series needs?

