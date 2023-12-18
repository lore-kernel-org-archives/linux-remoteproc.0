Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA4C41C62
	for <linux-remoteproc@vger.kernel.org>; Mon, 18 Dec 2023 18:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQd+Mk20"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-591c3dc7265so1542777eaf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Dec 2023 10:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702923985; x=1703528785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVV1SiqPQPkhXh/JH+8K5ZzPNY8J0yDKTDuA4TlZD5A=;
        b=bQd+Mk20OGeilcPr81rMA0iIBSs2ztV5HfjXdhCJ2A5oTlZz1HOqGSMeG4pd1cpZ4T
         efI2H8JDmCNeOzKFltRhlDzQ1aNVs49OHwrTzAyNfCIybWz4/C8zDjsMPbJYaTsZfBtw
         4w2wHpDhA9VW4c7Q0e8Bi7F9bNoC2WJqz7AEzC3RsJu/Cpx2jyVlBmyvyzTJwv8+SQL3
         xW0mvm9nCqk3vom2TvG/OHt62ynzBqltHfvRudwAX0uY+3TJmWOWMO7/MoanzVK/G3Zz
         oreFAiO4hsgeaMgSs3iMU7+Y+OoHuFcYzz+A1pkJt7io55IGQRxTBfYBPnbZ55Q/w/Ru
         rzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702923985; x=1703528785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVV1SiqPQPkhXh/JH+8K5ZzPNY8J0yDKTDuA4TlZD5A=;
        b=sZm/2vtkk3/w4BOHR4sgA2YiK7iIRcZWf18S4C5wMIkr6cYqWChWH8dS2e8RT4k/qe
         s8rh67JVHsCt0SbNWEXKXxNrN8ZYFeJ+218moHuL+lG/B4wN7CheNj3/RouFo52Niw+S
         qXERjr/Ce+b/aAQpuWWgK0KLXgtKZma0q3SQozYcWZMB+LY/kXlqTh7Xrf9H+kFDSBU+
         beBRGM8okAfQncaRKGjJnhhRFY6piBTSB6OkGod+P5IfzV73xxGvSEBHZwGtrODiH4C9
         126VE87tDWgg4JiwLAOWgSOAwWztQMZMCqkM0pshBmuSJfHmy6RDnf+DrUTGGA/sMeAm
         j97A==
X-Gm-Message-State: AOJu0YzwMjw/iYOV+oG/Pt53TE0Vi4InlpxQ5ncYwetk+V7D00ixEoa4
	uobcjFiQixU3aCLdK+wFhtvFrw==
X-Google-Smtp-Source: AGHT+IFgJn+WvvISODLJNEydM0OoT5CKlICg/Q4seb/gLVLuwE3CFzKBzyBE6kOaL67IWVDg4Q0Uvg==
X-Received: by 2002:a05:6358:60cd:b0:172:eeb3:5d47 with SMTP id i13-20020a05635860cd00b00172eeb35d47mr247169rwi.28.1702923985156;
        Mon, 18 Dec 2023 10:26:25 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:2305:cb4d:bdde:b1ce])
        by smtp.gmail.com with ESMTPSA id k11-20020a63ff0b000000b005b7dd356f75sm2401645pgi.32.2023.12.18.10.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 10:26:24 -0800 (PST)
Date: Mon, 18 Dec 2023 11:26:22 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: virtio: free driver_override when rpmsg_remove()
Message-ID: <ZYCOzlJILOWOtfsS@p14s>
References: <20231215020049.78750-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215020049.78750-1-xiaolei.wang@windriver.com>

On Fri, Dec 15, 2023 at 10:00:49AM +0800, Xiaolei Wang wrote:
> free driver_override when rpmsg_remove(), otherwise
> the following memory leak will occur:
> 
> unreferenced object 0xffff0000d55d7080 (size 128):
>   comm "kworker/u8:2", pid 56, jiffies 4294893188 (age 214.272s)
>   hex dump (first 32 bytes):
>     72 70 6d 73 67 5f 6e 73 00 00 00 00 00 00 00 00  rpmsg_ns........
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<000000009c94c9c1>] __kmem_cache_alloc_node+0x1f8/0x320
>     [<000000002300d89b>] __kmalloc_node_track_caller+0x44/0x70
>     [<00000000228a60c3>] kstrndup+0x4c/0x90
>     [<0000000077158695>] driver_set_override+0xd0/0x164
>     [<000000003e9c4ea5>] rpmsg_register_device_override+0x98/0x170
>     [<000000001c0c89a8>] rpmsg_ns_register_device+0x24/0x30
>     [<000000008bbf8fa2>] rpmsg_probe+0x2e0/0x3ec
>     [<00000000e65a68df>] virtio_dev_probe+0x1c0/0x280
>     [<00000000443331cc>] really_probe+0xbc/0x2dc
>     [<00000000391064b1>] __driver_probe_device+0x78/0xe0
>     [<00000000a41c9a5b>] driver_probe_device+0xd8/0x160
>     [<000000009c3bd5df>] __device_attach_driver+0xb8/0x140
>     [<0000000043cd7614>] bus_for_each_drv+0x7c/0xd4
>     [<000000003b929a36>] __device_attach+0x9c/0x19c
>     [<00000000a94e0ba8>] device_initial_probe+0x14/0x20
>     [<000000003c999637>] bus_probe_device+0xa0/0xac
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index dc87965f8164..1062939c3264 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -378,6 +378,7 @@ static void virtio_rpmsg_release_device(struct device *dev)
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>  
> +	kfree(rpdev->driver_override);
>  	kfree(vch);
>  }

I have applied this patch.

Thanks,
Mathieu

>  
> -- 
> 2.25.1
> 
