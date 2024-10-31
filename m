Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A68713B5B7;
	Thu, 31 Oct 2024 06:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730355305; cv=none; b=QAYhFbBkXfXTGB5rItAmCMtlcxGsBsIUXB4RnEa3O4suYhkDN7KQpQbsvNrA5JvbWpHvqz5QOk+F4XfRSHxQYrMr4fLZYh6SY3r28YDRe/n6ngwNC6ScC1x8UjwuZnG/Hs389sQj7JEzlW/YMjRAc5gZjW0W4YuK0QXf19t05mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730355305; c=relaxed/simple;
	bh=/2IfPP/kPsd912xC+PLNTP5ZoGjEAYutZ9wVPBQfvuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFCiYZSmPDSYR56gDQ1FR6d3s/hFAUX0Aav3aphrkJllCF2GBzlSB6ha4FU+ikTdbSlQA2KvXxFAJENjqTmauAnzkOJitTh8GYeayP88/f7wTXZIBR5stsbdSg0G4nCpg5gvSnFuzoNJtT53YrVN1SGFyjfbSVW/VKFoRHSw2y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=d6VQldyY; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="d6VQldyY"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730355289; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=vw7QPvnKotts5je5C1UU+eljjlhNkVENeMXFIwudP3g=;
	b=d6VQldyYhwU55focFb8/wpuk2FXISpIUJRoM3joeM0gosgevxXCouKwjlT2ZR7NhddhqI6qJI4hjG8URdhQ3BzwztLHeyM1cSk1Yj6I8Q3/AJ5NHJ7OzfEeEPoU3OMeelddpbu7NtQepVV0d4jSs14v7b56cunhazyIqH78L1Q8=
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WIHH.U._1730355288 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 31 Oct 2024 14:14:49 +0800
Message-ID: <b27412f1-4ae3-4daa-b5f6-9fed246fcc56@linux.alibaba.com>
Date: Thu, 31 Oct 2024 14:14:46 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwspinlock: Remove unused (devm_)hwspin_lock_request
To: linux@treblig.org, andersson@kernel.org, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org
Cc: longman@redhat.com, boqun.feng@gmail.com, corbet@lwn.net,
 linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241027205445.239108-1-linux@treblig.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20241027205445.239108-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/10/28 04:54, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> devm_hwspin_lock_request() was added by 2018's
> commit 4f1acd758b08 ("hwspinlock: Add devm_xxx() APIs to request/free
> hwlock") however, it's never been used, everyone uses the
> devm_hwspin_lock_request_specific() call instead.
> 
> Remove it.
> 
> Similarly, the none-devm variant isn't used.
> Remove it, and the referring documentation.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
