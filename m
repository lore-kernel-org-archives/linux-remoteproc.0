Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715339;
	b=ZVxqX2pN989hYxcy7L26tXan0x4fogZyjBIi7OC6zhgpX6vB5n49obwXgdyj40P8kO+i
	 8VcLGnGi5pgIy7OAlLfW5M3m2Pg1vrP9Lw/BvBUk3r9ytQo/GjXbDdYd3R7P32kDbIkQy
	 Y4xIXAckoNQKP0AKloHeFR7ttGe130N+PRMHJ8csLCPlP6m0bgwaKXi6ZEiZWR0WhCias
	 ozpTN7FcWaiM+cLFbxd9MeNk11xgaYhPWx9RnrtQBBANinFODW+FKUsATMv3cN9C4K5ZT
	 /tvx+l58d13iKdUvTsmWNahq5xetilZFQ069hCgwnbxqDWCk9Jc2iB213/Wkwx95kwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
	b=FMN38vmXw6lbCy1j10bsCNo37ddZSGzvfsG3j2vt/fagVpxv1K7pKWntPrdgZdWjlTCm
	 /xvwNUPYLPSsSyH2UiLQu11HMEKHq3phX+0ydzjPD3f1bc1TVOC4jb8rZ43uO1ivS2lUw
	 Xd1gf5z9TCxC/tP3Vt88IRyoxRwLl+aKH0UHfP9n0vqhnDPF5KlrEcUfUuoNh3vLXiWik
	 hjORRb+s0GhhgK4R1P9wJGQkVmF+8wkbIPs/qIcQiJNYHKJBn9T/0iU/IoI97QhwuVwYQ
	 LPjoA/SZ76xYwAzZOp8NKAh6ArXg9OzM2hjzPAg+y2a58lNu6UCzzwwWsw0C8/RfrDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUOlkfG5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E58606A326
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Nov 2026 14:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E58606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUOlkfG5
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso3412129e87.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Nov 2026 06:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715337; cv=none;
        d=google.com; s=arc-20260327;
        b=Tgah9QcLo8Kv9Hk1YRyuRQlkuWzRwnH1nwdTBXfpdWelsvGG0suK4p8H5FrRrTkNnI
         8UyeugvovlClAfjHGsPLjMgrhbnvN7FM/YkJcaAkcVMhs9op/kY59y8BBqu/tRgud6Hn
         jrLwlmzZZFBIWoV5T6OVhzg0duqbl7zTgVEUy0h3WRH+0zv2dZTcdqlgRVQRhloZjMvy
         WUNrwHM7vPBRC3822oGseun35/luSpqyZraFQpma5nnN5LbmiuwvHS5vVZuhbsyC1Za/
         TOPAEoi/CPef6KaadtKF79Mw4gUBKMmJ+/qQN+BXl5puowFF/Vqj60ExRbCjSc1H6uSP
         TuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
        fh=8brJN2pOGqb7HJPJPAo7CGS5MXJuel7lLj69MYA8wP4=;
        b=JBbh841Xk3GM/R5V2fIrHDeEeUUT3FP8IcGkXsUzJY4+aDz+INF5BGb3sFP/4RIT4G
         wXeVXouSlV5wRNIldUbwboVBMXmKozApsTK5AnP9fjDSEf9IVPl2J7dXCfOU4kDa5ssJ
         KiO/7KYhbEf5aZiKPcVIsVOfHjnrk5VUx1AbHPrNsidW4kQzyKkQY5B/0f9T1KlsmEx6
         VP4DvWOOMhA1q5oKNqjJhlTR7uRyvdwUNasW5tJdkE20J6lA39VRE+l0gmGcplPFcmso
         9eELBwwGTuFSf80PHpHl6NZSD0fMQI4uze3J4AGxGgGAVCzpXth3cHzyw31O4cvJK0SY
         zmgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715337; x=1794320137; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
        b=hUOlkfG5WAMcs1RconWNpTny3UWvGBRJKYPQV6YB0NHk2a6fzbaDGT2sr2+zJg4h29
         JVJ5K+cjpwamivKJIic/018tnkPjWwOVO8qxkzxZuT6FCpmYyIEprc64vIwx9FwxRBZM
         ciBMVX3FB5b9syVFwH3aADqvk4k/+I0WLahTZkG51GFYrbPYy32g+7ked9ewIZkBJsAc
         m6EQu6mOii+Ulm/shipEvCO0e27F00Jgpvix3FlBFTxBs85FG90sWB4014WevUtKKTvo
         Qiypq3AVWk+DshEj6fYkakDsw+Y7a3jB9hLiYHue8PSw/uuIS9LVcILHghTxFym8HSDE
         6VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715337; x=1794320137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
        b=emAIitgI1oshl8pmrBX1SM0Qijvbp6cwxbOlhKUecpgJmK4aUx2hihKiaC1e8IJ4cz
         dHptcMd9xRbBVwi3U1JoXBgSqVgiQ3rhooOOoleEh4ih2NA3WADs9QxlLQqpAi96PgGR
         ecT8LLgzoAPhtQ8lqCLF23w23Mt7jCs12ssBmYkXwfh7zR25EI2rYJ5IAmDTBDJJLZAV
         mthFnkDlC7mQH5SCBjatq+gHtSlVFcHyZZUp8XWMvEDbgGAkZ1w8S/kIstDh5ZwFCwDl
         1mSKsQ7Yfk73QXsPBambSKCCH6A+11VozDchKcXrohquzMLwRHxiIzG2Ee/7j38c35EV
         GQyg==
X-Forwarded-Encrypted: i=1; AKwUvBx4EHFipLs9oAWsb0I0hlL1+0XrFa531hKkaXafgI6HsBuhQE3JWG0XVteAoGlutibiFnB5J/yxBIbeK7d0XQc+@vger.kernel.org
X-Gm-Message-State: APuU4Z9q4enrLgEVy8twV7Dqq/fQ45q25c2nyKSMm/PJxd0GzHd8ccj6
	jbnYhqlaCzqtrl9nUeIS5tj0PTctBPHmW1mSeol+fMDLOpZNzfgpaN4Nid9YiCe12PNKFjeihyQ
	NnvbZuaF3wDQeeqkfc/8dfiVLemzs8b8=
X-Gm-Gg: AYBFou16nrBfNE5LLV6fIhqPFKFaSgSpUviouPQ4uEVfmfe95Asy6D+C6I0ZzIlPFW2
	SyfkVelkW+BztispWEZgenunpVMOnn1XtGl+VEsxXjeD3kSovWGOJDyEdyajORnbeFPX6zHRFGQ
	rlY75MtE9NmFgPOWAfDhgo1X3eIMzvbAp5U6iswH6OmgSrDYAPrbdyRxwYKLEshaKFj/6EBDaMk
	0Vcrm+ZXAhX+fG16oUAr2dfxQgH0meEghIBFYGEqS/8iitU5cgWxJkJ8+6aw+H17UkxDaZJ1/qP
	w/mvdcKg5BOL7i7bXVeBq+wnKWLmTqM5sMNqxg0PQ8P8RiURJcqyvv9sVL+1gcX0SfLQlHy0+6A
	Z6D+OMBIzyT3DxgAWiNtuq9Q3PhdtgUM5Rh3vebgDIgz0e/j+6q4nuqyJFFlRIzpLk+SDp+sMqS
	7CO8Ph0v8DncEQeT6d16Wr/knsIE2AqbZw61A8wS4+nohB0Pu5+HPvypKD/E8BVUDU6cMpyqeEF
	pZMB50auZp+MAyJVcyBlZo=
X-Received: by 2002:a05:6512:6689:10b0:5bf:db9e:7520 with SMTP id
 2adb3069b0e04-5bfdb9e7553mr2538316e87.25.1793715336819; Tue, 03 Nov 2026
 06:15:36 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it> <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 11:15:23 -0300
X-Gm-Features: AclHuK8cFyqPPDbhURLrOci--cGby4Nti8tUDUPWT8TrjwRXBOSlhnxIc9j5uBc
Message-ID: <CAMAsx6dogk20pTtpGaD_Ci2fam01UuUEe3KXDTH7UVjwRBRqnw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
To: francesco@valla.it
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 01, 2026 08:28 PM, Francesco Valla <francesco@valla.it> wrote:
>
Hi Francesco,

I only have a few language nits:

> +supplied by the remote processor should be marked as dynamically allocable,

"allocable" -> "allocatable".

> +try to allocate it using dma_alloc_coherent(), which will resort to allocate it

"resort to" takes a gerund: "which will resort to allocating it".

> +either from the first ``restricted-dma-pool`` region associated to the virtio

"associated to" -> "associated with". The same wording appears several
times in the patch (e.g. "associated to the virtio device's parent"), so
please fix all of them.

Thanks,
Daniel
