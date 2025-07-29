Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905D52248BF;
	Tue, 29 Jul 2025 07:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753774382; cv=none; b=sr1KaeyVmib6LqKtbnR8lTkQmQnbY76Ii2Ssg4e5Kp7wFQGKOnFvWVCI31vnim0Kaif3ADvfxXUGAMC0uYsjTLC2+xj6Ixx8fn6ZA7tL/XC6uMaQ7UsDDMCHLjJHT6EhfP19RZ+vZfPtWe8fsnK89553pBVCDCzPYt2S80nnv9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753774382; c=relaxed/simple;
	bh=+qkN1pbzIKW9Kd/NLd7ZhBY8dg2S6+H6XSP9SwZEz9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaZz8QMqaFc2Puu2HfO5jRfnDoAMEhTKwkByCqcLErZeDYKpqZiIkKIqt0WBIYHTWR7PocyECYgSrZyL6GLvB6MssXYJvC9iyaKJ3o+tCswx7bzQY3Jxjkc+3wgm8UKVVdpcRwH9m1zhpbd71sI3WdckyEJb4bA170peAWIDVh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Kv3Em3L2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Kv3Em3L2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=apneYLHwydMPi/gb7KaIvSpsXgg8LtmB27Bx7XMY7VY=; b=Kv3Em3L2+DuuMSFOEW+ob0wHW3
	nyOQP3IxCtkhlmrN/Wnjgad5fu1Kn0F5LqQggrq+qT5HW1WU7WYYIhKbBtdeb8N/njehocq2Obapr
	0w2u/NCeb0E40tXG31hg/ND73aNz89rqIPxTttZiyScAgAlTiWIxWXxY4zQgw0Z4qxj/LVjw9704H
	9WuvdP9x+Us+xC2ISvWHLMcKe10C8+g/CTfwl6KsZmxVhdCtjZk7XtRkXxvZ1fhi7Ziy7HzzohOPm
	9m4bWKkaaAv+evioB9FEhj2indnM1qzhFtckp3Y/foLOVdiHhDzV1lKn6EnuP1a6WQ2GYwqOg/kkY
	kQgB0Ghg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugepX-0000000G81p-0mhv;
	Tue, 29 Jul 2025 07:32:59 +0000
Date: Tue, 29 Jul 2025 00:32:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yu Jugen <yujugen@huawei.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, baolin.wang7@gmail.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	nixiaoming@huawei.com, wangliang101@huawei.com,
	yangkangming@huawei.com
Subject: Re: [PATCH] hwspinlock: export structures that affects the KABI
Message-ID: <aIh5K1hvk_n8cch-@infradead.org>
References: <20250728021151.115197-1-yujugen@huawei.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728021151.115197-1-yujugen@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Jul 28, 2025 at 10:11:51AM +0800, Yu Jugen wrote:
> From: Jugen Yu <yujugen@huawei.com>
> 
> The member "hwlock" in struct regmap is defined with struct hwspinlock.
> Both regmap_write and regmap_read use struct regmap as a argument, so
> their KABI are affected by the hwspinlock structures.

There is no such thing as a KABI, and moving things into a header
"just because" is not acceptable.
