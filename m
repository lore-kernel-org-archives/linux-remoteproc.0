Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA70149B5B6
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964085; cv=none; b=Cpy6mQMD+pYmM0cvOgiHW5F2G6shGSH799zT0UbUncsfFzAg3ug1OejFl2/sfx6n7+CVjbgA8OVq4xlMpCiGichrwVP+UX2HzAiW7dX0bKNkGINAbLdIoXKj0q5YzG0UBJHdkJE9VsZ+3OkdfDWDSQ0AiEGg8vB1hCcOUgA/gn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964085; c=relaxed/simple;
	bh=16hksQs//RdVLFuvKyiS++F2SQ5vrk8MCYmqqR/nkGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3QWs/WJxu1HeUsRwXhRNy9p/SmkRHZuzJcPxuVShK4AOuUp7pVhbdeqpHtR5rCx99CuB7wpkHA99Mqk3Z6acvT+/1cNuAtJrTbMGck6K7KlcT+mgp45pkzazs25SLezblfsQ9ibrsaLEWlIEgJHeqsFINygJ0SqRATXZgAp6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vmym8c1+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmym8c1+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso947073f8f.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791964081; x=1792568881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmneww5mKP53qtLk5sZTycPhJoLLQoam9M0U8cXGxVI=;
        b=vmym8c1+CVTQwZT+sCnhlqu8Spr71dNpW8sWYYj+HUiugiWX1IvOrjlCS3B4wWzy4I
         gAKIgzQG0DxdHFEtV8Uj28wkLV51wZQGa/9/kCjDL+aRwLTqehVjQMSvYJavpbjc5bQK
         e4J8EeRoC2V8WvsEWNFo8pnrI5cATgN7/8mIsz3owyLG+8hNotVYT/5gSNgz8++q26B4
         F6APAl78WbqAKxK1eW+SgE3t3FLSVWWV8mz5e5gkMkJa/myih4NtRhbuY9NnuZe+nbIL
         IRtS0sn6F6wiYb7c+sVpD6fIzUBX52r7IRy8SkB18go+eB0+EjBqw8Yz7gRSeeJfplI7
         fxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964081; x=1792568881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmneww5mKP53qtLk5sZTycPhJoLLQoam9M0U8cXGxVI=;
        b=fXALREcCPLkTLz7fOgEoVyFUyIPQS9ES35W0sbWjuk4Q1Ytg+8pUgsjScvYwCM9IFE
         j6f8+IMy9UyhzptJ7fXjENIsMiYFBs/JMJgg2Pa5Gcn8PjPW9pPu71zp5aNsCmg83tdI
         MY8EO1MnY6+pvVMKRVETiOmPMlkcIFcGIyBe1AlxQrm2Zw9wFtty5su1gbJY87RWVkv3
         F5CmO19z/9PhbTul6AzelGyGMQ9R+1HbkDBqy5gBdozexQjhkzFE3r4uC8esqrQ46ntA
         jbOSOZoQRJz3pFg/vcxaHEhFpQOZUMAWEGm4s59Guor8vGAY1McMCKmsCDrLYynKtlcI
         iYpg==
X-Forwarded-Encrypted: i=1; AKwUvBwuG8rRmhQYCZ7b6bt+gqUPcMOELzuu5V/XqE8zmL0IRpgdmLLU/mVAj9Q63VrCWpdmj+lxP9XIDjZw0OqieYg1@vger.kernel.org
X-Gm-Message-State: AFq9FYJaBecxG40aH0AW5DaiXC2xlwlpArBS7N9nNxEX5tj9LVoQ9XfE
	Ed4/6zHzUwJ9rIBq6+IlsmfsA7jtB/pT+KJP4TKwigKAR588O45uXEYdNVjEAcYEh7M=
X-Gm-Gg: AYBFou3WHaurl7yaZ7OVw9F0V0te7vwyuET0Ydjb5i2GhaHp8EIEW9ueP/9neukvHic
	q1KAdiVj++c6R29cKiUscbuMPFtlNQmrJudxJ4CYzDBXX3fPCO6lr9uxr5SuMN0WhlWg+FQlxBp
	T8fKXNW2ODDpdGmqyXz0kOZol/FQ7P+ej4AzZKD/+dz++Fkr8VqrFWwcw+2CpDGwVoUxz618qVg
	udMd/034PMgcmsCDH4uIhJCXlIgaoCxjJcrpRRxcTC77tZIcobsCnglNZZxZb3E04dMZ9HMtZq0
	qDEH23P9b+9HGe4OfyEKqh9dON790Z7BIoqtPfFMQirahtNxm1D9is9UYYaivPS/BF2OyDkn4SO
	CPUGuEzKflrib5GSpQHSnVfts0rDWjY8VuCvACJJyADMnRJtIlKjuEvQGCydfPGUSK90CFfrp4h
	/GBKZM4leiHHivIUoraTAqWekKnz5ISOxaYvJAnPYKN0jBevqkzppj/4JCvlGriBfG60OHg1KEo
	eB311Q=
X-Received: by 2002:a05:6000:4553:b0:488:6bcb:ec92 with SMTP id ffacd0b85a97d-48dbaadcfd8mr20006696f8f.17.1791964080842;
        Wed, 14 Oct 2026 00:48:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:b6:d666:120c:88c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa21sm11407149f8f.9.2026.10.14.00.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:48:00 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:47:55 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] remoteproc: qcom: pas: Decide early_boot attach
 at probe time
Message-ID: <as8zq_GMu1pkoMYA@linaro.org>
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
 <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 03:00:37PM +0800, Shawn Guo wrote:
> For early_boot subsystems, probe unconditionally marks the rproc
> RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> bootloader actually started the remote. If it did not, attach sets the
> state back to RPROC_OFFLINE and fails, expecting the core to boot the
> firmware instead. The core does not do that: rproc_boot() treats the
> attach failure as fatal and the remote is never started.
> 
> This is hit on Nord with firmware where XBL no longer brings ADSP out
> of reset. The remote never publishes its inbound SMP2P entries, so the
> very first state read fails (debug print below) and the ADSP stays down:
> 
>   qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
>   remoteproc remoteproc0: can't attach to rproc adsp: -19
> 
> The ready, stop-ack and sysmon shutdown-ack signals cannot change while
> Linux has not yet interacted with the remote, so there is no reason to
> defer the decision to attach time. Check them in probe and only mark
> the rproc RPROC_DETACHED when the remote is up and has not been asked
> to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
> path is taken. The ready state is read first so that a missing SMP2P
> entry -ENODEV is treated as "not running" before sysmon is queried.
> 
> qcom_pas_attach() keeps only the fatal check, since that is the one
> signal that has to be acted upon once the rproc is attached.
> 
> Assisted-by: LLM
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Cc: stable@vger.kernel.org

is still missing. Would be good to have these fixes backported, since
the original change landed in 7.3. If you used b4 trailers -u and it
didn't add the Cc tag after my message that would confirm my suspicion
that b4 won't pick up that tag. :/

Bjorn might forget to add these, so it's likely easiest and most
reliable if you resend again with the tag added in both patches.

Thanks for fixing all the nitpicks!
Stephan
