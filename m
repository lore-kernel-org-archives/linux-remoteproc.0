Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D234D1CEAB2;
	Mon, 16 Dec 2024 06:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734329426; cv=none; b=eCvkqHeuXJDmlAslUxrdz8FRv4CjSa0hNchMOTEzAZZkSxKkabAqHVacHusBRn3gAKZNLNtCES/SSsCL9dDvDI3Nhpi9E4+YvRoLwEDDXQ/1u3VbCQkX+4JoD7kRnqfQ+gHKdw7qnJMi7/iN3n/QFSSQBeDwzqJeAPa1rdXOa+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734329426; c=relaxed/simple;
	bh=XONLVTYEPWrX7zy1+FdHBLbma+fZly0HZJOWRtJoc60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqCYXSo0AUwPP8r6TMxCM1IPu3MXZXN98I5EBiKd1biS0KlJwv1jGqaIIsPppVmGzsFCU5zCjlnRvy02NfIHdi9x1iZBDTsEaUA/NoxtywlTIguG5tDx71mMPHG7kX9LBIapsC/X5CNi9X+JkHzIGAWsjFYWCRY2WVMpNayTp/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=U63Ae2zY; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="U63Ae2zY"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1734329412; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=8xQ0N0/Rjp+MEh5plAk6VQJkI0EXuXf4MmXHKQ1yDww=;
	b=U63Ae2zYokBlWdUSKxrdiVbUyP60dJZiV8X0/jsalcy3S5XQlDMcMxIzsVECPl4/BWDAdQx18W3z0jHRpXvlKfMj2XVEHrFqMX2diRqIo6F2e1RNpAAfJy5lzgll0mqo9LZzkC3xLyzcSFg4w/nyD79BdT6L+j7bKxBAUSJBZ80=
Received: from 30.74.144.135(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WLWSGlk_1734329411 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Dec 2024 14:10:12 +0800
Message-ID: <843e2358-3548-4f6d-be17-bcd9362e7f3e@linux.alibaba.com>
Date: Mon, 16 Dec 2024 14:10:11 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwspinlock: Remove unused hwspin_lock_get_id
To: linux@treblig.org, andersson@kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, boqun.feng@gmail.com, corbet@lwn.net,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241215022023.181435-1-linux@treblig.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20241215022023.181435-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/12/15 10:20, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> hwspin_lock_get_id() has been unused since the original 2011
> commit bd9a4c7df256 ("drivers: hwspinlock: add framework")
> 
> Remove it and the corresponding docs.
> 
> Note that the of_hwspin_lock_get_id() version is still in use,
> so leave that alone.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
