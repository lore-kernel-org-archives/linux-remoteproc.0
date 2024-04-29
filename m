Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24ED8565B
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Apr 2024 16:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714408715; cv=none; b=b0eF6BZm7jekD5oxIZrj3ScIhHZPxaN++VBn+UzYswsj6uyQHRuGiYCtjVIozehZayXw3H5iMrFSxaBTkbGEhzZeY0LDsBm32WTDqGfV10UW62InCSGcVimKCWnlhaaXvoXx0XWiMZmm37l1W1Z4h2/oWFcfBfo21gyfeB0lEro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714408715; c=relaxed/simple;
	bh=zzQLDSf8QCqzlsm92G/iDCAL1afFjJirvI3oBkxEXl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQr7y+Fy00zhXM0hjn5QdNZCgtrqHJqMt1KFf17o+4hitm4Gmx2HKC5xO2Sa6vYA3+MqvlM/j+gjGmcsPNH8Xp4MJeI2AwGnicw8234qafjrp6ffAjAZHbygX4BwfZoRo+tx03WWyep2Wtqb75jY2HAt/ut1yTuPqwnBmYznv2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LEhubX+9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LEhubX+9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e8bbcbc2b7so42436715ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Apr 2024 09:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714408713; x=1715013513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oWPJdB/cSlyp73RwVZm1H6IMvyasz+OHn5rJwfM1czU=;
        b=LEhubX+9Alqj/OCVgnQgK0olQchR1Iu6SqvPor+QeQex7v6Sffv9Dq8znnlJjqjhjt
         Oj4XxzimahDvZ5Wx3c59dLo3ygLh6TIF8RY9EnY8xxS1wI9AbIdG303M/O4HCNMUEx8K
         whNQprGHEib09Bl/qQdmN4q8ism14AGC3nLRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714408713; x=1715013513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWPJdB/cSlyp73RwVZm1H6IMvyasz+OHn5rJwfM1czU=;
        b=TN9GEbSzzte5JCn/zCM/nmDDLISKJaZbwuHYpqCiLuRiKD7sunUy3uDtnLfVNflVAT
         WD/UyohrmsbmmfWTI3kgsgMh1ooyyYJwjT1kFZN28BA8cUtvNnI32fmkrkboOUvlri2t
         H5+D5OEGFDD6bHMgXq/JT3UVl7o9T5WX4zorDXiRuGFEp/WGUbKm11yB3o/4JbeBwCt8
         Swm0nNvfXYrc8+BxbHs5w7Fo6cwxMfTwvuDGCTe9gyXR5Ji3fVDiqvCcPKBd9M2u/UUK
         WERM9hGyhqNeS00mhhnEBiAxsnmUbcdMIx7SGa8pnpQQ6DrT/kVsPnxLccPy4CZ3tptv
         58JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE4YiUc0qa12DpTEy2LNvFuWVMZZ0mCSbv5ZVC0UyGQhFZlV2nrKdeF0ftXKO4rTyTxfDnCbgvHt4sO0dZywwg/HMxn2QxQLpRTJcvIBKj2Q==
X-Gm-Message-State: AOJu0Yw6H/UH9K70JtwY3gfuHP+pwTEXeiDkCcPp5dxVZzCBGeeywPjM
	9BgM6xJC8HPkds+irByK1BnuhF3G6UYqz0cBj26pHwuiN4UHfbf8kfxj7mQDjw==
X-Google-Smtp-Source: AGHT+IH/1T9jHNNNCaTcEgyVwTWxxXD0FLNfQwEJ2iZeJ96Js8aCUDwFpJsdmhmvt08FTazyJSQEiA==
X-Received: by 2002:a17:902:cccb:b0:1ea:f7d4:2327 with SMTP id z11-20020a170902cccb00b001eaf7d42327mr15393377ple.9.1714408713045;
        Mon, 29 Apr 2024 09:38:33 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w8-20020a170902a70800b001dd82855d47sm20510893plq.265.2024.04.29.09.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 09:38:32 -0700 (PDT)
Date: Mon, 29 Apr 2024 09:38:31 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] rpmsg: glink: Avoid -Wflex-array-member-not-at-end
 warnings
Message-ID: <202404290937.C22567C1@keescook>
References: <ZgG8bbEzhmX5nGRE@neat>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgG8bbEzhmX5nGRE@neat>

On Mon, Mar 25, 2024 at 12:03:25PM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end is coming in GCC-14, and we are getting
> ready to enable it globally.
> 
> There is currently an object (`msg`) in multiple structures that
> contains a flexible structure (`struct glink_msg`), for example:
> 
> struct glink_defer_cmd {
>         ...
> 
>         struct glink_msg msg;
>         u8 data[];
> };
> 
> So, in order to avoid ending up with a flexible-array member in the
> middle of another structure, we use the `__struct_group()` helper
> to separate the flexible array from the rest of the members in the
> flexible structure:
> 
> struct glink_msg {
>         __struct_group(glink_msg_hdr, hdr, __packed,
> 
>         ... the rest of members
> 
>         );
>         u8 data[];
> } __packed;
> 
> With the change described above, we now declare objects of the type of
> the tagged struct, in this case `struct glink_msg_hdr`, without
> embedding flexible arrays in the middle of other structures:
> 
> struct glink_defer_cmd {
>         ...
> 
>         struct glink_msg_hdr msg;
>         u8 data[];
> };
> 
> Also, use `container_of()` to retrieve a pointer to the flexible structure.
> 
> We also use the `DEFINE_RAW_FLEX()` helper for an in-stack definition of
> a flexible structure where the size of the flexible-array member is known
> at compile-time.
> 
> So, with these changes, fix the following warnings:
> drivers/rpmsg/qcom_glink_native.c:51:26: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:459:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:846:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:968:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:1380:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 38 ++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 82d460ff4777..878e3461bce1 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -30,9 +30,12 @@
>  #define RPM_GLINK_CID_MAX	65536
>  
>  struct glink_msg {
> -	__le16 cmd;
> -	__le16 param1;
> -	__le32 param2;
> +	/* New members must be added within the __struct_group() macro below. */
> +	__struct_group(glink_msg_hdr, hdr, __packed,
> +		__le16 cmd;
> +		__le16 param1;
> +		__le32 param2;
> +	);
>  	u8 data[];
>  } __packed;
>  
> @@ -48,7 +51,7 @@ struct glink_msg {
>  struct glink_defer_cmd {
>  	struct list_head node;
>  
> -	struct glink_msg msg;
> +	struct glink_msg_hdr msg;
>  	u8 data[];
>  };

Instead of this change (and the container_of() uses below), I think you
can just simply drop "data" here. I don't see anything using it except
the struct_size()s which can all change their "data" argument to
msg.data. e.g.:

-       dcmd = kzalloc(struct_size(dcmd, data, extra), GFP_ATOMIC);
+       dcmd = kzalloc(struct_size(dcmd, msg.data, extra), GFP_ATOMIC);

With those changed, I think this patch becomes more readable.

-Kees

-- 
Kees Cook
