Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BD94766B7
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Aug 2026 15:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844732; cv=pass; b=ACicwOv0CnYKMyf04vlnTjOBF4ckfDnRbfgv5gAremFKhUXr0POh4QVIsLg/SvFQrHxldaJcWPd9tMDTBM3uL0xmMBqgHZmQI3XBjwrmJCDFdT3S+o1C227ES64Jse3WZqX5lcpxsZVtuc1IApAIxkaisZP7BJ3bKGclndTlRVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844732; c=relaxed/simple;
	bh=OG0N9hfGAjQrVAX3fWQSJUJJsrOM4IzsIrO2Jd3scnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pob9atiiDs/kNsbNEE89PwGaz7q+UhYmnWxWKOCZfxXGft24vqdYjXGEMUWMVxL+09qqaPdsMnzGvBevw2QEZWaa9pIOXkoUp9xbwgPgSgy7L4Uqj2HY5EnO74jQy/omvhB0Kab87vQ+Fqn0b/7ITl8aarma3JGXogrs4doT3Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ix2QlMo2; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ix2QlMo2"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so3916442a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Aug 2026 08:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787844729; cv=none;
        d=google.com; s=arc-20260327;
        b=JAwKIpnkh31i/0tOpCTHHcv9g6p6bjB+xzKyUgU6hIKCTO6U/qCTLw1+B/eOPUvaP2
         sQF16fjIJm2K6p83p/Bsck7AZEAQGvwNzfBLq0eCIjD04GOwzVQOrmxFKeNeiXdwW+Vc
         JLsgrIji2M5BPI3yNEZ9BaMbANHLPCvvlCWSgzxcn4wb4FuysWCgqld7MoKKxW01ncx8
         gPdZE93M7EURIDLkECUfzj/r6nGCJq6DZSt6n4Zh+U5bRJm3J0U58G8z84XoKlEdKZFK
         MG+R8a0jZnE7W/10tqXz1fml6fBrzLZcr1KuJnPQrqgrQQknfet0Rs7snr09kzlpKh83
         DWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UIv7VSR1qWuO/v2ZJpqzpJWi1mJBnpbQ8X8B9JtI4ZE=;
        fh=dYSihUxPDdpYxhYMJ9t7caRn143L4g1Epfhvrqvg0qw=;
        b=UeSXMiJb2xTcKGr/4CtnJ5PLy7RXnYlDS2BvEb4wekN45HtAJTVVQJyHdC17AJyJ+4
         IkkaStY1bB5kRnMw3ndlKagzl613NA33cdjNq0wpuRmN22KR2HYejyaQQ/C8l0yIDY//
         MwnDt6W/r5Kyzhf3K1rlBe/LA0CBYWv08eM6yPTjgTB+Ody1ItNXlZDL8RwGKIjVoUyO
         bB4opMvW8IhEC1cJBEWAWz627Z/tKp7iXnELdV37tX+KKjwq8kopGrbmtQA+ptL/bogN
         v2EDOE2RWrGGEzdBg3MU3S5a1eYLy3QrFFjPO5ZlQYxjG0mDaf05XvJ7eppJYu8POlQz
         sTRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787844729; x=1788449529; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIv7VSR1qWuO/v2ZJpqzpJWi1mJBnpbQ8X8B9JtI4ZE=;
        b=Ix2QlMo2aCHagueA2Hh1XX1FslIG9xVnD/5WBwwTxM/qR6UlLp8FOkyRvpkmrTeGDJ
         dszpZW2M7O3NOg9bDwo7XPX3/3jNe2OJMX3rn6VXhWKfqAy9HPCR4v4GwnooTksC5Xfc
         +0wVZTsL+PTiGyJOUWoWo5COzAtWmU5X6Jst6Ev7JX8OnOBmAR5HrZ4gZGa7cVw2huQb
         dun/we43BfCXrf5/sygdlE25Kc2f6oa3dQasnnBnH+4K/u3QaNS0wgAJ6khz/8QwT32z
         FKVFyZWMOTebbjRxvpWXbOZUPZEyC9OpyYTXWu4u0+g347ojWN6DiFfySHpEKgvcfrQf
         b0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844729; x=1788449529;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UIv7VSR1qWuO/v2ZJpqzpJWi1mJBnpbQ8X8B9JtI4ZE=;
        b=oCgS/pypO/N4kPiOR8faieplvdX8u5KB1+2aEVBSZo44EKnQQGlwDHAYimYGxjP5p8
         JA4hxfX0k1e/VmMlNJdAaONrxP3munrCP6wiPEK3aRjXcxxINI/tqWWrw0ZztnDYQxtE
         hzpNbT0/Kpu/UbMN1E0Z6LnrKwBZHmPU9FiWCPE76AQphG5PCIZL9MsrFd2y4oBLxtyA
         rN2XnEGj7CEcT/HOStSVOX201AR66Do7ZnKQxnedV5u9+yIta4jv3DVqAlEZp6xT2csB
         fAr/G0TCYpGOZEOcS+q5walBfWhZmP9pbLP+ctBW11tJd5PQtkfVDPHQ7x3Lq0cgCDYN
         nmtQ==
X-Forwarded-Encrypted: i=1; AHgh+RowXWbxp9/rUx4j/dQKbWYLF+F8vAs/CJPS8QXLVDq2SxfzZratwtJ0nU5iA7kQNsoTGhVtOlz7kknsjIEAZG3J@vger.kernel.org
X-Gm-Message-State: AFuF++njNnQCuGn6xCni8QzY+wTkSPmiex7QI4bWzhS8kyW3SF9jKKML
	m8sya54Y+ymyzn9aULuETCDuhOIUtn+Et/MIHxCsYGgJS8Hgklnn8cUZngr9VOp/NXX9/MC06rw
	FQb5KeLgxpcoit7VOm60xzfYWBh4rjhr3x6OrmQFYZw==
X-Gm-Gg: AR+sD112oAxvmH7OwCNK5veyRvtEP73BJ3vUtQ2tpLSxkloXrY7/dqbf5D5cHFahzqs
	M3dlTNz70Kt/ICzUKlTPUpFL0fiBc8cZ5xs9j62zwCdnpJzb/bxNLBRukEPNSB2GCtAttI7DrMw
	ALKJLrx97wjOXP9SHTlOkyE3KGKnU/uRuZnFM7T1V9IzI3n63bEFQtj+E07O2rjJuCI2wLBV1Zb
	PIZQ6OtcMIsbAoODkqQOfn3aqO07bECsIaC1GGaf+d2u6PwGQqJwlyzzMdYthsSFBtsEXx8jKwQ
	PLXKFaBzmuuLxMfYueUSc4by891jTlc1ce2RLKWNIok4cwUQF5/NmeJtK1JJKt3dQbptQ2fZ1rB
	lL1Tt8kpVtWoVKA==
X-Received: by 2002:a05:6402:280d:b0:6a5:def7:b872 with SMTP id
 4fb4d7f45d1cf-6a5df65b507mr15081475a12.9.1787844729501; Thu, 27 Aug 2026
 08:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826173901.2329068-2-tanmay.shah@amd.com>
In-Reply-To: <20260826173901.2329068-2-tanmay.shah@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 27 Aug 2026 09:31:57 -0600
X-Gm-Features: AcwNN1W_es1PGxYSzN0croBntB4Dm44YdKdLDhoQ3lXd14i2sPM4RZQ2S8ZcSo0
Message-ID: <CANLsYkyWg-SQ4o8AiaNeu4ALP=rrxmUd5OY9KDHNC91vPtHnKA@mail.gmail.com>
Subject: Re: [RESEND PATCH] remoteproc: xlnx: do not send new mailbox notification
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 11:39, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
> Only write a new message to the tx mbox queue if slot is available in
> the tx queue. If queue is full, then do not send new mbox notification.
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

We are finally closing the loop on this patchset.  I'll pick this up
when RC1 comes out next week.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index c685bb5fa62c..0e71edf8174c 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -381,7 +381,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>         int ret;
>
>         ipi = r5_core->ipi;
> -       if (!ipi)
> +       if (!ipi || !ipi->tx_chan)
> +               return;
> +
> +       if (mbox_chan_tx_slots_available(ipi->tx_chan) == 0)
>                 return;
>
>         mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
>
> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> --
> 2.43.0
>
