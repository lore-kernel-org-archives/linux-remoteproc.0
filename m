Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382501;
	b=euESR3PKIkkH3ipVpMxYkjzu52kRWvXSeboxWnu57grjaoj/Nt0lnFb8J1A+RaOW5b+X
	 YEtDXs4BcLVqyKVOOIEXDjlHs+WMP7O+fWl6aVMpQtTdwl48YCEQLdid+YZnG9iQqzodI
	 P+jK5mfkJXo0upblqiocBqSmxUfP/SbaZHbQxTOgKjaulwr/NGJVS+1Zy1ld19i2EBMnX
	 fWiIrxp7JwsykUUlhjDwOYg2nthPlrniKzPnGk0bXzN7SXwD4UVs6FlFnMaRaGBikKEbS
	 RPW4OJAmJsZgT+pV5C0Fs1PTWWtDeqpxwqAWAM94A8LgERKqYw6I4D6Uann37ofydGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0FM1eyvAUwK+fLhgDxNFYZgoPZUDzKxnOOEbqswS2Es=;
	b=36h+4zkcLdA5m6MbFktn8XhA/VwNRemVLxMY1z37T25VoMzQieShxoKe3FhMuVJWW+Qy
	 IKu7/9zvakNKcKasHcARoqA+Vb7Nwv+Si7HaE7hgBjirZJbfVFJiNviJ4a4WKxhzb+EJR
	 ztMUX1IumOp52ycKVuSm8C4PZC96mQgrfFAk3koGpRQzlPSOnXJhn9i5Z9AkP5+Wsq5gi
	 YZwB5XjJzt3CBySVYJzjZyYHp/zCVGHNlEqFGN7onvezG1ygYoZRPu2Bdq8BzRYruFmhU
	 pGK/zfbxcVJFamUVYrV68PQumKXc5gNpk9vc49D3m+XkAOMrnhhFxSegF7aOaFr+SkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xhYnTDgb;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480A7606A31A
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2026 17:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 480A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xhYnTDgb
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso414546a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2026 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793382500; x=1793987300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0FM1eyvAUwK+fLhgDxNFYZgoPZUDzKxnOOEbqswS2Es=;
        b=xhYnTDgbjHVEDgLd9FeTne28vMcHSOYTrn9emqGQjUbi7VmzKD7Bc3veKg4GaTkhxb
         VH578t4aonLwErix+BvTS4CePJD6pz1x4JpizuSozYDRPGHMY0WqL1rzG8hAX10QfxoN
         slsC8eOO9A/HGY2jOtEnWgnLRLCZwUgb2HBm0U+r8guFc8VpvPzV63mSwxXhL43SN56h
         3ui3PTG8AFMemE4L+RblJZsAzaC3w3GogKUBai0JMDElGxOzKQUSD8Kov3jjZWi4UaZy
         sYq4U0AiE/9jbJ03K47UF/vDxwyTtcxD5RNl9IwwYWTBENpeyJzrZfmu2M43YFicc9Gb
         0Riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382500; x=1793987300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FM1eyvAUwK+fLhgDxNFYZgoPZUDzKxnOOEbqswS2Es=;
        b=srv0T4QRVTSgsg5bm8DYyZM6SS67TihPLG2HeoJht1w/0BWsxShioe1LfpEGWZ8IQF
         fvRxwX8BQyYrYrj/x4FIto0Hyt1Y0UDwLyTMIiKBp6H0cpW5mHJ7QZL2euUGDMOyVWEv
         Zm8UD4wdWt2yu8AacDUHXYa895SKxWP6c8GmPhKzr/sXDCPReKZTNEeAZSBWVUiIr286
         z6VtpkRsNu2tHhBE8ve18gU3tS3nrbhO8cdoVtMSsydJYHoT+0w8VsTV6M3w5ErfzCe7
         IRPPZ/PiSkMdcL7vAwDR0ZawupFPNW6sYk2P2Q6nTmQlpbNY8f5dLs7UFKOLGK0qHk1G
         S9+g==
X-Forwarded-Encrypted: i=1; AKwUvBwaPbPKEpMfuwsosRSsgtKObDstY1ucBAums4O+SOHq5zgM7YkKezV0phNFlK5gRxVGu0rumweUmmLViTa+vgB6@vger.kernel.org
X-Gm-Message-State: AFq9FYKDNdse4Qsn7ona0l+inDoEmjkp0+ELZCG5ljvNh6YzkwkCbo5b
	MxsVZDEQgFTSy2qb/8zb+jvgnIIlH8TAUE9g8nBNhaNrCU8q9M2DamH2lMz/O5GR/g0=
X-Gm-Gg: AYBFou2LOGtYMjncCYwlKzTWni1YUKfixI3vxXxXI/Gn/tqoE7WFJ4S+gb0G42sQfnm
	TaZxWQaNbCj6LU9vtSDVDgxGqc+cz7CR+McUl5TUINh26H/D/AOHBL5r/MV+RyXOdIEt1QT1dpR
	/kErFJSQese7izuqbuDNAiQP2bOLixIZQRmtgrkhdX3/DOBLRM8ZdXTmCIuw0Vh88ApjBJL6x71
	5e8cwzwh3BAlA7quuQimqiWaaJHgSrCLrWE98ZqeDEw+PPbQaxieglpRp5GcYrTJqferVfrD9um
	6fkDpnSlohssNnn/X+kr/YkcIbpXE6Ku30Z4sBMDv2SM+h9gguSQ2BNW5yRIR93xDJReNZQ/K31
	kexAbCAyYoLV3PuDkkkrIBP8m+c5GTy19nSF0rlwW2mJAXPd9gc3catqWVaxA9kXy59HCiO8Elu
	5izbHETvHKbu1NhtuJAAB5IKk8kC9aJGv8Gl11V/mN0G12J4DInYgHyWiPvNo/QnQPDughJBiLD
	NnrEhf2H6iNXuBWcQRjosww5VtzOXcE4ioE5oDPs+CSxEGPBDfONGjpWhYF/Dd9V9k6DjZuxFnw
	rRp64uBEEmbP6dRvZhuqGKKPX/H1AOI=
X-Received: by 2002:a05:6a21:a247:b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3e928ca2358mr2811333637.18.1793382499460;
        Fri, 30 Oct 2026 10:48:19 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1341:f404:be4:486c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9ab752sm297668b3a.45.2026.10.30.10.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:48:18 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:48:16 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rpmsg: char: take ept_lock in the
 SET_INCOMING_FLOWCONTROL ioctl
Message-ID: <auTYYGFsSqPalG_y@p14s>
References: <20261026100306.68019-1-yuz08559@gmail.com>
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
In-Reply-To: <20261026100306.68019-1-yuz08559@gmail.com>

Hi,

On Mon, Oct 26, 2026 at 08:03:06PM +1000, Yu Zhang wrote:
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
> The other eptdev->ept users get this right: rpmsg_eptdev_write_iter() and
> rpmsg_eptdev_poll() take ept_lock and re-check eptdev->ept before use. Do
> the same in the ioctl. Lock only this case: RPMSG_DESTROY_EPT_IOCTL calls
> rpmsg_chrdev_eptdev_destroy(), which takes ept_lock itself, so the switch
> as a whole must not hold it.

Please get rid of the above paragraph.

> 
> Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 550fda2..49c0784 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -343,7 +343,15 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  			break;
>  		}
>  		set = !!arg;
> -		ret = rpmsg_set_flow_control(eptdev->ept, set, eptdev->chinfo.dst);
> +		ret = mutex_lock_interruptible(&eptdev->ept_lock);
> +		if (ret)
> +			break;
> +		if (eptdev->ept)
> +			ret = rpmsg_set_flow_control(eptdev->ept, set,
> +						     eptdev->chinfo.dst);
> +		else
> +			ret = -EPIPE;
> +		mutex_unlock(&eptdev->ept_lock);


                ret = mutex_lock_interruptible(&eptdev->ept_lock);
		if (ret)
 			break;

                if (!eptdev->ept) {
                        ret = -EPIEP;
                        break;
                }
		ret = rpmsg_set_flow_control(eptdev->ept, set,
                                             eptdev->chinfo.dst);
		mutex_unlock(&eptdev->ept_lock);


Thanks,
Mathieu

>  		break;
>  	case RPMSG_DESTROY_EPT_IOCTL:
>  		/* Don't allow to destroy a default endpoint. */
> -- 
> 2.43.0
> 
