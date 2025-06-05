Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9440D1DE3DF
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Jun 2025 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139067; cv=none; b=hQ5JeRdp+g8OCvsZE/JYx0XSN+5X3kPbyApi6vOn0koE6IVWniUx0jWXSSfAP4nUC3IpDMJBIT4f9RNoNl3JvnKts7GQTX+zzYs6HEHH+SvCbzfDRQ3ztaslJeTSpvBtbUL6ulMLX7hMAS0jFfl6XBNmAtw/5i6dOhJLtpShJfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139067; c=relaxed/simple;
	bh=WgMGgdMd38oyIPbik/hGQ40Tix6e4NF6Yzsh7po2Fqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIpZYjyTx6Ut6cWWkBMSb5kXJqku7RvsgEeausYAQSP7U0Fy+79kOLcoDLi5m5yLk4qzec//+dEYIE2Yiz+AOeBR+PyaO7voci8CJYWrBLOuX/pQjy9LiM+42BcuSuPtPkyaFqvmkpMjvY3VXjN48kzw0fahPFq3vvG4rPJSi5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=apTrcIVq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="apTrcIVq"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55324062ea8so1514300e87.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jun 2025 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749139064; x=1749743864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IL2rqOYu8VKVkpdUoK8lFHqW1MNjlNlFCTBMUdbtw5I=;
        b=apTrcIVq+XRT0VliWIz7SMUMW2qyhhk+nRIOtZCUdAyTbY3Hd0o14nIjAy529f1DwZ
         JKqMfdXUcr5L7Odf0Qqs4dq44baXJd4OsS8V8eX2jVj2IZRmAkQxcRZviLsLa3FpbaRy
         //YNr2+yW1U8RLlFeN5pS9R+Ctlqng3NSMpUMCI6IyuIdysXr1sJrkITFIw1f5auTOpD
         5Xl+GgYKs9uy8J/i1JLX2dtDyObYNSb9nZP5pp9TjgMQdR11ABUZBW7Yd5rZg02sW1qO
         we5hNTBCtaKBADrqF3BE9n24DZYB+03L6WDKf5IttMgjRLx0vuD3ElQkLEOWGdvyt/vr
         ucXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139064; x=1749743864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IL2rqOYu8VKVkpdUoK8lFHqW1MNjlNlFCTBMUdbtw5I=;
        b=MdGlJyB4Bjn+tKjS0Px2eqC60e/oIEqUdXNSWAJih79gg/3Cpi6+vW8jzX6T4eO5oF
         MHj4QCKg+z+RFUTLM845nXQwfnnxJy4XjxkDEI6gElhJxibbsdGRyw9T9pyJbnzM0k1X
         32doT2qdHyEYSh/fpAS4ELb7fUegn8nGLHpkCLJmPrl0lWNNhdKot5S3fWjByUPVeHPH
         XkoaJ/W3ZsDapUurX5iDEQHEDIfhiUqTMLTEW4eA1Eti3IcUnj4L55+5lrBhGFcaebMa
         edWJKNMy860PZ5BSX9E/ewCh5WpPS6b7GrE1u4KBZdk6NTTQ+iGr5Rv3/JHPe2zMDr9M
         1wAw==
X-Forwarded-Encrypted: i=1; AJvYcCWCz6VQNHtfAmqv3bqV9N/KU0mJAduRPLRKh55gdMXdSjX+yJx+jJMDXQ6xBnXyFmAbFRxMZRSlBfUjloL0HHFy@vger.kernel.org
X-Gm-Message-State: AOJu0YzBsabD074pFF/YXTPsXquQMAQ+bNg3kywjyvUYg2uCD2N4u/sW
	8fRaisIFoix4uK19fRYVOFLfI6ZL4JMj9t+V0xYDe13jgO2j6glE9BOUGl4uXuT3Eu0=
X-Gm-Gg: ASbGncvpgSj6tCTtYXYNaOmWkvPnEQb7fifq+ceyRIB2Ucac8ZcEJhUJcJiNjCzIr7P
	opWcsdR1wv/i/CTRLx9bGfuJIwdQdXWc1gkwAsvx7Bm0o6Rmc6NERXxS/u9kPYblZ6VJeskYw87
	JakFIMYq15k6cr29PMMgovFFn4Ixo7uhl+Y4fcDOvAQiZrwiGIypoptwfg42So9hbOsyJVSZIFZ
	d/VwS4wULczlN8nL9kLaJsjXGGlzXi8n5yUZ5/Gru+CfBP6cHfsFJWEImvUuDey53LZhI89eVuu
	U3ObxfCzcJmFMPxNbwQlP5BYnT3P8R5hY7rNhATA2xZNE+EEvlfVKzrkfF7gVeGZl1m2grL5cjZ
	9pBV3OSlogSyUYv5UEBEuGWfJ5aUBnwwC7A1dUghhTgC5hbLAoqyrsW8=
X-Google-Smtp-Source: AGHT+IEB3YEeO6zjpPzz4GmREpxraxHTzP68+ARHxZnojSSC5uKraBhg6PJus5tZV4YR+AghTaJ4SQ==
X-Received: by 2002:ac2:4c45:0:b0:553:510d:f46b with SMTP id 2adb3069b0e04-55356df49e0mr2781393e87.32.1749139063513;
        Thu, 05 Jun 2025 08:57:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379374ffsm2647976e87.216.2025.06.05.08.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:57:43 -0700 (PDT)
Date: Thu, 5 Jun 2025 18:57:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] soc: qcom: mdt_loader: Ensure we don't read past the
 ELF header
Message-ID: <bsnn6xpkubifuwxz4kccvves3ifq4ocp53qmbobv6ilmnfuh7x@eejawp7thorm>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
 <20250605-mdt-loader-validation-and-fixes-v1-1-29e22e7a82f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-mdt-loader-validation-and-fixes-v1-1-29e22e7a82f4@oss.qualcomm.com>

On Thu, Jun 05, 2025 at 08:43:00AM -0500, Bjorn Andersson wrote:
> When the MDT loader is used in remoteproc, the ELF header is sanitized
> beforehand, but that's not necessary the case for other clients.
> 
> Validate the size of the firmware buffer to ensure that we don't read
> past the end as we iterate over the header.
> 
> Fixes: 2aad40d911ee ("remoteproc: Move qcom_mdt_loader into drivers/soc/qcom")
> Cc: <stable@vger.kernel.org>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index b2c0fb55d4ae678ee333f0d6b8b586de319f53b1..1da22b23d19d28678ec78cccdf8c328b50d3ffda 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -18,6 +18,31 @@
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  
> +static bool mdt_header_valid(const struct firmware *fw)
> +{
> +	const struct elf32_hdr *ehdr;
> +	size_t phend;
> +	size_t shend;
> +
> +	if (fw->size < sizeof(*ehdr))
> +		return false;
> +
> +	ehdr = (struct elf32_hdr *)fw->data;
> +
> +	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG))
> +		return false;
> +
> +	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);

Nit, this should be a max(sizeof() and ehdr->e_phentsize.

> +	if (phend > fw->size)
> +		return false;
> +
> +	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
> +	if (shend > fw->size)

Same for e_shentsize

> +		return false;
> +
> +	return true;
> +}
> +
>  static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
>  {
>  	if (phdr->p_type != PT_LOAD)
> @@ -82,6 +107,9 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
>  	phys_addr_t max_addr = 0;
>  	int i;
>  
> +	if (!mdt_header_valid(fw))
> +		return -EINVAL;
> +
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
>  
> @@ -134,6 +162,9 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
>  	ssize_t ret;
>  	void *data;
>  
> +	if (!mdt_header_valid(fw))
> +		return ERR_PTR(-EINVAL);
> +
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
>  
> @@ -214,6 +245,9 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  	int ret;
>  	int i;
>  
> +	if (!mdt_header_valid(fw))
> +		return -EINVAL;
> +
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
>  
> @@ -310,6 +344,9 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  	if (!fw || !mem_region || !mem_phys || !mem_size)
>  		return -EINVAL;
>  
> +	if (!mdt_header_valid(fw))
> +		return -EINVAL;
> +
>  	is_split = qcom_mdt_bins_are_split(fw, fw_name);
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
