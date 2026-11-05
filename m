Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897783;
	b=qPMEMN52ZNEflY775a/2HMUkhCglQt6EWalgbiD5sO3CvibXo17sl5g0Oe5nlFGA4dkX
	 /6MzamIsApHERwSpjlTbgn5kWpOCWb3DGuLkMYXJsIUdapIv402mfFD+ox+U/IqWypoC2
	 5+CffXO8JnsPv7kHJiiMQsG+0lUUeyZHTqpnA5JFs4Qs120e+OtUX5cOIGkGw9sOfBMTL
	 NudcA+STBLvzMaGKPuMc2YviiQvU8wI0nWWNJY+30WinPpMFCzTy5GoBNOI9rJ9WgSqQl
	 rZdux5gSKrdknj1ZQtU3yKEO9HHr6/O2nmDcVxm28udq6It5N3oypnulB7Ls1Zbb7qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sXd2orHtvS28hhtBKOplUBavOCjio3xkwlj67EhnJWU=;
	b=VgzHr9QNI+MKsVt0W8mQUXKGm63UlnQGzSAp34JlwoL5dQW3hUn5+uifEI011+4l70zW
	 iuiV6nS/721+krayO8qfot76z8b1dphZPuNnvV6ddL61XFpOo99jzOObNujN9hpplBWOI
	 OfYgFC9dKPEUN3uYJsI1rtnCvNtiwFl8Gd6KE9ViKehvporDwsTlA/gBIdrrr6aiqJtjH
	 7BXsEzldS4aKoaUUDIHocN/UN+IF9ix1wQW6E6m3yxmu2nfJqea3hDYQo11HIm6HlTj4z
	 D2oRfl6U8eK5AFW3vKnnySqqCnytzc+1OXnpdmpLzh/Ba5mky/HHu/kHv//gZRIjVTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ogmv7BG4;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C778E606A326
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 16:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C778E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ogmv7BG4
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed408b0d9dso418245ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 08:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793897782; x=1794502582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXd2orHtvS28hhtBKOplUBavOCjio3xkwlj67EhnJWU=;
        b=Ogmv7BG4r7uuYCYpQN4niqDJbGkvLKQFENVq0R4ZDqv8WEJDpk9oXeQLiFTF0VDwVh
         ZW3dRsM8vxcktUqR8BLPtebX//inW1Bfn+BdikoT2ufnSbeXAlawBDAqYnbaT3ve01DM
         3G8UuPv4JjwWiGSABW/YQ7BK3i6IWEMQ9LScK6uM0QnBbM5NUX9L6hePyG/VFQGhGVwp
         yrutnEdo+lMbKqhRElOL/guTxtCUcJSmflLE54qW0EGDnf7gaUt6sZCWETWxTFMS2xBC
         qsOyvOrwd2F/C+7CAIc8Ue3hnsor2FaZUI+4GfsKHJuF0Q/sB7GfEwgbcbMAkxaqgHXu
         eEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897782; x=1794502582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXd2orHtvS28hhtBKOplUBavOCjio3xkwlj67EhnJWU=;
        b=N7v35v0kzNp5drPt3aGTxJng09I9v0R8bSAE91g5Awvh4GKqxYR7H8Ht7NP2lrADa/
         /uGvLB5jePHHnGRQBhoQRSvlMZ+3EO1eGc8OhZdQgn2uV/B5vB6DtzBVQ2T/O2jRFhRv
         ezpP2MfJ3CBSMixb3Eo2Lauks4ejNzKLnJe/rwoUoOuPEc3dcQVIw7u30tkSXmZWJqoh
         n2NlfKwFtEU5M3ZkpFlgOhOW5kYTYOOIumFYFyMctePMhKxDMwnwkEpGiFbd0Ijrnv4W
         nB/xBTkfvw2MwrZSmUjvkh3nx2OQ1HKZFaOnZ0jLGCe9vcVS/Gy9Ejr2TVn4lbEXUiZ3
         kMjA==
X-Forwarded-Encrypted: i=1; AKwUvBzwZQdUo152d3NaGev9FvxN1P6witWp0ktE8irmI8epN1unhERch9Da3n+7PUKxFVNNci0WY8s4QmQAPCAOz/T/@vger.kernel.org
X-Gm-Message-State: APuU4Z8LPCPvXQAa527xKY+7OkSEg5Fd6l/j9Gl6j0yqqCDwisWI2+mL
	Usdxi/gVo4Vfs+Lgn+5ACqISvDAL0A/JMwZlPI24AR8AaQdi9EwPmxCJZIu2QK2WBS0=
X-Gm-Gg: AYBFou3P6yi9zG3ZRQssLBM0Cuu+UFVBfq2yj/cX+HD59Wh147fbKAIz97OnWr1PNce
	v4df2sHB0XALS4ekFksHRUS2xRhxWvjoLtERx6OaZhXDJO2XErrdBnzvgqSUB675tlHmbEMneRk
	c0hKzhUJvM6sGtoLp5ouaGgph/hX0YXPHVSynORLU3OfiacnmQq1GC2qSJDidhA0jJ12cE4fWO6
	gWNUUhuyx5Km2NIj7y12q8MGkAKC4v0xdjUo9hENj8a8JWp+Z0AkxN0t9BaquXBrcObt0Itl8ap
	IA9ZU10l8TVkkCWUsvUcnCYMk957CUQF2XbNnTdDIV23DyFDhYtX0zfF1JgcvMzTxO8J89FxE3z
	X4kDhXcZ8WRUcSmu2OE3mZ8Dd1BCd3B4A7RfwTG0QlfapqmH3JRM/lz6oQMi08I4Bh4p45vg1ik
	onTc9oJGkNxpH4LgRCwu9k5R1PwzZ6St7XW4zHdm9u2JHCNIMTDEMsS9aed5zbFh/AM7Eg1EFGB
	i/l/bawWp0YAmgLIIcgyCifbj4E3ViRUGcS00mMNoJqZnzTElhnPlljV2pZL6wgw6VlBTd58+EE
	As2FouBKAnAl+EZTCK0lOiHxR2bEKPE=
X-Received: by 2002:a17:903:2290:b0:2e8:3d48:4d8d with SMTP id d9443c01a7336-2ed40ee5387mr1933055ad.0.1793897781997;
        Thu, 05 Nov 2026 08:56:21 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:c7a9:fa1d:b267:7419])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed09127905sm20286145ad.48.2026.11.05.08.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:56:21 -0800 (PST)
Date: Thu, 5 Nov 2026 10:56:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: char: take ept_lock in the
 SET_INCOMING_FLOWCONTROL ioctl
Message-ID: <auy1M1b4-ymv0OyD@p14s>
References: <20261026100306.68019-1-yuz08559@gmail.com>
 <20261031090650.23701-1-yuz08559@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031090650.23701-1-yuz08559@gmail.com>

On Sat, Oct 31, 2026 at 07:06:50PM +1000, Yu Zhang wrote:
> rpmsg_eptdev_ioctl() handles RPMSG_SET_INCOMING_FLOWCONTROL by calling
> rpmsg_set_flow_control(eptdev->ept, ...) without holding eptdev->ept_lock
> and without checking eptdev->ept for NULL. rpmsg_set_flow_control()
> dereferences ept->ops, so this is the only eptdev->ept user that does not
> honour the ept_lock discipline.
> 
> eptdev->ept is torn down under ept_lock: rpmsg_chrdev_eptdev_destroy()
> (reached via RPMSG_DESTROY_EPT_IOCTL on a second fd, or when the rpmsg
> device is removed) and rpmsg_eptdev_release() both do
> 
> 	mutex_lock(&eptdev->ept_lock);
> 	rpmsg_destroy_ept(eptdev->ept);
> 	eptdev->ept = NULL;
> 	mutex_unlock(&eptdev->ept_lock);
> 
> and rpmsg_destroy_ept() drops the endpoint's last reference and frees it.
> A SET_INCOMING_FLOWCONTROL ioctl running concurrently can therefore read
> eptdev->ept just as it is freed and dereference ept->ops -> use-after-free
> (or a NULL dereference once ept has been cleared).
> 
> Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>
> ---
> v2:
>  - Drop the paragraph about the other ept_lock users from the commit
>    message (Mathieu).
>  - Bail out early when the endpoint is already gone instead of an
>    if/else around the call (Mathieu).
> v1: https://lore.kernel.org/all/20261026100306.68019-1-yuz08559@gmail.com/
> ---
>  drivers/rpmsg/rpmsg_char.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 550fda2..d8868fa 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -343,7 +343,20 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  			break;
>  		}
>  		set = !!arg;
> -		ret = rpmsg_set_flow_control(eptdev->ept, set, eptdev->chinfo.dst);
> +
> +		ret = mutex_lock_interruptible(&eptdev->ept_lock);
> +		if (ret)
> +			break;
> +
> +		if (!eptdev->ept) {
> +			mutex_unlock(&eptdev->ept_lock);
> +			ret = -EPIPE;
> +			break;
> +		}
> +
> +		ret = rpmsg_set_flow_control(eptdev->ept, set,
> +					     eptdev->chinfo.dst);
> +		mutex_unlock(&eptdev->ept_lock);
>  		break;
>  	case RPMSG_DESTROY_EPT_IOCTL:
>  		/* Don't allow to destroy a default endpoint. */
> -- 
> 2.43.0
> 
