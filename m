Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="biz4J9KI"
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49C710E0
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Dec 2023 12:33:31 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ce95e387e5so1948127b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Dec 2023 12:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702067611; x=1702672411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QDm0samvC5P/9akoWEQePvjxWAFPqGq3UDU4GCf/u2w=;
        b=biz4J9KIXHNfFMbLKLd6Vip5DgTs3WNWMW8OpSG60hKVvBvSBf85ugT4Fp9ClQtRxP
         4lqiRypX3LgE/bv921jNX81eUMvjfb/wFOs4Z0bnokqysi04jMakpvOKogTNba9rVrZV
         rs8te3+sMR9g24qEoevHKZpoYK/jEGzCPWJBys6zDxaMP2eo2pfsx86s3TwGJJ1UZSeE
         z3WDvlGvYpsRbHE0/Usjc1yVDgcG40ZTjJ3BNCgemb+UtgQh1Xfd0tu4uGKkLVJZTDYC
         zj2NcRvF3PLbTaQ+Q3KgvkWjw/NmuoIt52qkWDtU9YqokTlTdFKD+xZqKm4+NavD0huv
         ZY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702067611; x=1702672411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDm0samvC5P/9akoWEQePvjxWAFPqGq3UDU4GCf/u2w=;
        b=Ndx0XuC3BV9vE6zf2dvi386sefkESfjCiu48FBnUtZda6pKG9t262BmUcG/h2Gcadv
         06aZDfTJcXJF6lMIKpCbPan9HWDu0qjenC0OPukbE0N0RzcXiTU/IuyO8phWSs1HP8dD
         Wn0kHDMZ9tSkdhYXmhvzdUj//GWh1/gxKmi/liNaE49UoQjijUuQvd/w06b0y74g+2pk
         AbD7fOe+uvqpJPoHgYNspGzTjuXyxzNVbxO/nl5PehZOw7TkGRXE2aDAvSsAsrywarda
         aP0/RlgA5GeIrsalRfL723lUWczAJJqKZ77OFevVpAWp84X/NpJ3hWW/Mt/sVP7jkiHI
         FOsw==
X-Gm-Message-State: AOJu0YxQxpy77/GhPvqWeEz3tT2aggsJ46eBCESHdrJRSiCPVux1AUxq
	FWZ5y+C3c7nxnbmrcWMVQH71CQ==
X-Google-Smtp-Source: AGHT+IFnMNHGLXwMuu/G8AJ6XSzadocAlVjm2CAHJzFuxIZSIqeBa5t6fI09aIMFEJdey2lv+sByOQ==
X-Received: by 2002:a17:902:ea0c:b0:1d1:c917:2e5c with SMTP id s12-20020a170902ea0c00b001d1c9172e5cmr833506plg.95.1702067611033;
        Fri, 08 Dec 2023 12:33:31 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:bc99:83ae:a2d5:c5ca])
        by smtp.gmail.com with ESMTPSA id n5-20020a170902e54500b001cfcc10491fsm2120947plf.161.2023.12.08.12.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 12:33:30 -0800 (PST)
Date: Fri, 8 Dec 2023 13:33:28 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Adrien Leravat <adrien.leravat@gmail.com>
Cc: andersson@kernel.org, corbet@lwn.net, linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: rmpsg: update with rpmsg_endpoint
Message-ID: <ZXN9mAXUeHopmdiQ@p14s>
References: <20231203200606.255302-1-adrien.leravat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203200606.255302-1-adrien.leravat@gmail.com>

On Sun, Dec 03, 2023 at 12:06:04PM -0800, Adrien Leravat wrote:
> It seems the documentation was not updated when `rpmsg_sendto`
> and related switched from `rpmsg_channel` to `rpmsg_endpoint`.
> This change updates the proper calls, text, and the sample.
> 
> Signed-off-by: Adrien Leravat <adrien.leravat@gmail.com>
> ---
>  Documentation/staging/rpmsg.rst | 50 ++++++++++++++++++---------------
>  1 file changed, 27 insertions(+), 23 deletions(-)
>

Thanks for the refactoring.  I have applied this patch.

Mathieu

> diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
> index 1ce353cb232a..dba3e5f65612 100644
> --- a/Documentation/staging/rpmsg.rst
> +++ b/Documentation/staging/rpmsg.rst
> @@ -68,13 +68,14 @@ User API
>  
>  ::
>  
> -  int rpmsg_send(struct rpmsg_channel *rpdev, void *data, int len);
> +  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
>  
> -sends a message across to the remote processor on a given channel.
> -The caller should specify the channel, the data it wants to send,
> +sends a message across to the remote processor from the given endpoint.
> +The caller should specify the endpoint, the data it wants to send,
>  and its length (in bytes). The message will be sent on the specified
> -channel, i.e. its source and destination address fields will be
> -set to the channel's src and dst addresses.
> +endpoint's channel, i.e. its source and destination address fields will be
> +respectively set to the endpoint's src address and its parent channel
> +dst addresses.
>  
>  In case there are no TX buffers available, the function will block until
>  one becomes available (i.e. until the remote processor consumes
> @@ -87,17 +88,18 @@ Returns 0 on success and an appropriate error value on failure.
>  
>  ::
>  
> -  int rpmsg_sendto(struct rpmsg_channel *rpdev, void *data, int len, u32 dst);
> +  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
>  
> -sends a message across to the remote processor on a given channel,
> +sends a message across to the remote processor from a given endpoint,
>  to a destination address provided by the caller.
>  
> -The caller should specify the channel, the data it wants to send,
> +The caller should specify the endpoint, the data it wants to send,
>  its length (in bytes), and an explicit destination address.
>  
>  The message will then be sent to the remote processor to which the
> -channel belongs, using the channel's src address, and the user-provided
> -dst address (thus the channel's dst address will be ignored).
> +endpoints's channel belongs, using the endpoints's src address,
> +and the user-provided dst address (thus the channel's dst address
> +will be ignored).
>  
>  In case there are no TX buffers available, the function will block until
>  one becomes available (i.e. until the remote processor consumes
> @@ -110,18 +112,19 @@ Returns 0 on success and an appropriate error value on failure.
>  
>  ::
>  
> -  int rpmsg_send_offchannel(struct rpmsg_channel *rpdev, u32 src, u32 dst,
> +  int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  							void *data, int len);
>  
>  
>  sends a message across to the remote processor, using the src and dst
>  addresses provided by the user.
>  
> -The caller should specify the channel, the data it wants to send,
> +The caller should specify the endpoint, the data it wants to send,
>  its length (in bytes), and explicit source and destination addresses.
>  The message will then be sent to the remote processor to which the
> -channel belongs, but the channel's src and dst addresses will be
> -ignored (and the user-provided addresses will be used instead).
> +endpoint's channel belongs, but the endpoint's src and channel dst
> +addresses will be ignored (and the user-provided addresses will
> +be used instead).
>  
>  In case there are no TX buffers available, the function will block until
>  one becomes available (i.e. until the remote processor consumes
> @@ -134,13 +137,14 @@ Returns 0 on success and an appropriate error value on failure.
>  
>  ::
>  
> -  int rpmsg_trysend(struct rpmsg_channel *rpdev, void *data, int len);
> +  int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
>  
> -sends a message across to the remote processor on a given channel.
> -The caller should specify the channel, the data it wants to send,
> +sends a message across to the remote processor from a given endpoint.
> +The caller should specify the endpoint, the data it wants to send,
>  and its length (in bytes). The message will be sent on the specified
> -channel, i.e. its source and destination address fields will be
> -set to the channel's src and dst addresses.
> +endpoint's channel, i.e. its source and destination address fields will be
> +respectively set to the endpoint's src address and its parent channel
> +dst addresses.
>  
>  In case there are no TX buffers available, the function will immediately
>  return -ENOMEM without waiting until one becomes available.
> @@ -150,10 +154,10 @@ Returns 0 on success and an appropriate error value on failure.
>  
>  ::
>  
> -  int rpmsg_trysendto(struct rpmsg_channel *rpdev, void *data, int len, u32 dst)
> +  int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
>  
>  
> -sends a message across to the remote processor on a given channel,
> +sends a message across to the remote processor from a given endoint,
>  to a destination address provided by the user.
>  
>  The user should specify the channel, the data it wants to send,
> @@ -171,7 +175,7 @@ Returns 0 on success and an appropriate error value on failure.
>  
>  ::
>  
> -  int rpmsg_trysend_offchannel(struct rpmsg_channel *rpdev, u32 src, u32 dst,
> +  int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  							void *data, int len);
>  
>  
> @@ -284,7 +288,7 @@ content to the console.
>  	dev_info(&rpdev->dev, "chnl: 0x%x -> 0x%x\n", rpdev->src, rpdev->dst);
>  
>  	/* send a message on our channel */
> -	err = rpmsg_send(rpdev, "hello!", 6);
> +	err = rpmsg_send(rpdev->ept, "hello!", 6);
>  	if (err) {
>  		pr_err("rpmsg_send failed: %d\n", err);
>  		return err;
> -- 
> 2.43.0
> 
