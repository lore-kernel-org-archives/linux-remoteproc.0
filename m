Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F25DF72
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992294; cv=none; b=iewUNvb4y/94M3CK99VXKbDr/m/orLjKPFKc0cy5/TZ/PTApP26k0he6qmyQkp3NYrplVHZjGOnS5ghgwC3dPhhi06hqnVXpu6fQx4WLlM3lr6moUPT7SjZ652RGrxCUya2SL1MSjrt4NVsOQ9K7TJSkkxcDLzWIru2cFlt+JCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992294; c=relaxed/simple;
	bh=PcMa6EAsrr3jvly/hU2WyQS01pilTlv/QvW8t2Acdms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqLxjA51UjYN/0Lss/lqOqYijA0sjN12vbRybBOiuk4zlvXa/KZBzAm0+AgU7ijGRFfwUiYdhp8Rrt3XXsFsQFg/xEuTJP9pLsegCnrKNsoTON8dw0+UnUL4p2TP7pzvFIDKo5DmY8HH4rXMbB6AFJIJYz39+46Ce/ZGFELAXvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wq48epxi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wq48epxi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e60f9af6e6so9423175ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791992293; x=1792597093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=;
        b=Wq48epxiQT4UxSJREDl0wKo2HFsiSSQDcXxgotDatMZbx4UxjtsEzWJLwLXfsBjI1e
         0WxTGjy8NYU8mLcLsNZOzO7Os7YsS9PU/IBqbpDjKshUaWFOtoE029x+gTFQEdrb0uaX
         d03HjBbzdEYeHYeDqUJvUs4r9By7wALQNQLw9T4yWIh77e10uyZkeeZ3wbvyLwafp0jP
         uSeFhHCQG0/GZFhGM0zl9iuBYjaF78nxqiHMS7d4EV/rab46D79mm2BXduF8hJ3xQmCV
         Pv+hhQJ3dc3cZubO8fwqQI2T5QrEHmwtIPmsyYfcwVYhXmYONP4qkh1kwjMoWSIomvRH
         j/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992293; x=1792597093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=;
        b=G/rgxZ1r0lg3KAyUkV2ldLpBpj7MdyvFiMHk8+B8ER/AcnydxYPFKeL/fzFQargS7q
         pXMUHNwLkcpEtNZikQE723J4MgcUEntC72d/6+bYGYmQRgVaXonK1aOBVDFsvV/VIGoQ
         WsD9IF78zBXaZtqM/9ojyOL3xemgzf8WEpM8xaRMx6L477RMNLaYZVfs09KDUR7bqPnV
         PvalZdeFBZ9yTAS5ceg5fYJcyYEkHddCaUa23H2qVm9WTSmxe/YYxrHRdI3/T8XNVevg
         LC8TpUv7Xxv1pjb3j8uKecji2yzOBkhPx5vqI5VwVxHwDR5D2VI/xc2w18rIE7FMbQ/h
         QxQA==
X-Forwarded-Encrypted: i=1; AKwUvBz5iEXAMbz1KtVbGaGvp/Xa8rK1iE3E0+8cjVum6uNaxtsc08Fkf/5/VKvtCdjO4pLtILqIGymEoxoPOxBAysgo@vger.kernel.org
X-Gm-Message-State: AFq9FYIgDnAuDcDGvEf7dRJONrvYx1IgAM9zuY7XFE2+tjJlyeE8fYeD
	SbtGU7F59bhZtq5t+7t1ErDL0lCsrzs3P5VZgoI92V0d89P+VmTgdwt2a0b/6bcydcI=
X-Gm-Gg: AYBFou2OE1sIp3iHRqRPDZI5A/OyAWk59qyX/3rvuSvZen4Dj55doMrPHKwDqMUOpcd
	2jSrY32Eh26aLmX2pVDHy9HA3SbTXRjA1d0ZP7v1kaUIhBZWW6ktx/EPIfjMwT5+uQ8ecVWh4kh
	Wn1H6rsILghRcctGqHZtWY1W1bQ0YnyA5lexTtpjZYE0CMsWW4D42Sm/TCvD4rtViApBNqA5Y9o
	Mr3rfo3pc4UMZV+Yid56WE0+Ms5R1Ks0xhTy+OSKZqFL/SasG4T9UZwCoPisSy04astYQ8Njnzn
	Lyz8h6+5mpYA36635LOpiCHgUUHEqzO5+yMapZAT1xw3w1m/yZRm5G3KSBkcz/RuGVMF8P5rNhR
	XLZfAU3Sv6TfYPXU0GxGUy70bZszi5olKQkWq/EJchs/rCrf+UAUT2ZeLg56AIaMgOS+wMIRu1r
	dFPZUJijjqC3rffpzzF355DSqznlv0f1+tXiaGMqpG1ZJHJwBlwMxfT6IV8Le2DbxyvrV5JQ59J
	l49F4RHNi+g
X-Received: by 2002:a17:902:74cc:b0:2e9:cb4:b345 with SMTP id d9443c01a7336-2e90cb4b71dmr35035725ad.55.1791992292750;
        Wed, 14 Oct 2026 08:38:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d009:9564:b54e:1fa2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16casm73740635ad.40.2026.10.14.08.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:38:12 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:38:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pi-Hsun Shih <pihsun@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: mtk: release channel OF node on device teardown
Message-ID: <as-h4Xg2KTvI7hiw@p14s>
References: <20261013074744.942560-1-thnkslprpt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013074744.942560-1-thnkslprpt@gmail.com>

On Tue, Oct 13, 2026 at 10:47:44AM +0300, Avi Weiss wrote:
> mtk_rpmsg_match_device_subnode() returns a referenced OF child
> node, which is stored in rpdev->dev.of_node.
> 
> mtk_rpmsg_release_device() later frees the containing allocation
> without dropping that ref.
> 
> Release the OF node when the RPMsg device is destroyed.
> 
> Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/rpmsg/mtk_rpmsg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 1b670ed54cfa2..430a9b2aa7bb9 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -168,6 +168,7 @@ static void mtk_rpmsg_release_device(struct device *dev)
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct mtk_rpmsg_device *mdev = to_mtk_rpmsg_device(rpdev);
>  
> +	of_node_put(dev->of_node);
>  	kfree(mdev);
>  }

Applied.

Thanks,
Mathieu

>  
> 
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> -- 
> 2.43.0
> 
