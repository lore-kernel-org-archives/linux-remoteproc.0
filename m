Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AD23E7625
	for <linux-remoteproc@vger.kernel.org>; Fri,  4 Sep 2026 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512025; cv=pass; b=oyp5x159Dp2AZ5kGhKKlRjwiMzFrROeGOF9QEcqYm9pAQUQU4r5ZmQHbhNcLka01AQ9GaLZTh7qz0cQ6rIrvEOh7sQguUaBnhdWD0r5xHcrCKdEiLo6oX//EJwoboX8JbllBiG951nlLTSFYg91j/1ocjP9kyhu+kp2tvsk/pLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512025; c=relaxed/simple;
	bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQZbKfFGX48PoAf98TCb28o4geZo12NRs5jvIy+87I+zD2iLMkkJcVFlgkOX36fC/s+36kHXyuxHR7Wi4mOUdYQtbPAzbr5bwbOHmgyVRXJhWrWa3oYZL48+YDIVh5DA9T67lYAlw7qaIGgFJD7rE/L/ByWXnUGQHi6l02Dd0ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZJulo9j; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZJulo9j"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso567718b3a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Sep 2026 01:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788512022; cv=none;
        d=google.com; s=arc-20260327;
        b=HJ42C8+Ow3Lq9JvHcGjTkctYbKdse1fPrD9fmHNy0FWZviGvWTX5E+4KbkT7+wNv0q
         iopEgMlF+I8vzUHttVzMCmyyD+AAXK6Erkc83DutYgXnDIAjpWAQryduseh8UdD0zXGG
         gFuiXaBfkkq4QM3vl0sCWRZ3zeTfq9X0ycBiM0xI1oqby/UOblReCkn0vRAshI8FlYLH
         rL5qC8ROkMsGgH7CyF8+BGsQjVKKlD1ACIkS90h29q772Wy0KhyEj6hyBkWJV8rFXdZh
         uJ769v5vBton0z4uYPCpSwnPyerrZluqMYc8TAPYK3j5IYOpJQUuo099B/JeBsD4tusN
         dB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
        fh=oGr/q284tUmzmlAZzqZwT0GDVrnOzF4mbaosYuiMWVk=;
        b=pJTCNTuQkDrFopT54u8giWb2Fb825jBxIdLzovsaLNWGXOO+WM8vpNZkCByypTL0uQ
         EX1t71W0bLM9eZvlccP65NVoQll/3M3XPidFjsuP45QgStI2J8/24WBKCjM9ZDn5pNMB
         Am51s4C0CQVX7tbkox1Nfu9OH3tMWx54PHhtnjot0tLGjnxsyZWIXrouLOIl3NfhuPAB
         Zn0KFaXpXnvRJu46RJICGCEvgyy85wiUfLdEMqe/GcWeVPN0SwPZrMSsAeI6Al2Ze3dd
         dMOgQgVUR7XHJLYuxewra7qM+zkO6GUdS3J70OUTPHGwDbpluvLhlmkH4AhLzpGKY3Xs
         tSxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788512022; x=1789116822; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
        b=BZJulo9jQqiYoxnm5Zm5YU/Jfpw4cSfSc72+jWkeVqaWiGQBQLd6+5KWCMZNJzwfFn
         hwT5m3yeuLwJ/pMcOXnHNH+JpHVuBxAU4y/Cz1hUM5W/8a/APGW9NdUBSm0OPDLocIsO
         cwvYdcHZqZv23Rrqo53E06UNywpha5Fnm2+r2dNVlmTBI9kM166BMVZYlCvuTT86h57K
         ki9J/TQqJXM8EWszs/CrMs5t6ozbthcuQZRh/wtuCQbXqPkvTFLwOPKTv9TsMUnvebvG
         zS7FY2hM6bDCEUccVs0LUsIE61bgwFlwAsf1T9hf1dDD7Zfhp9OKk+oaxksUrbE1TsQv
         iZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512022; x=1789116822;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
        b=Qw0FgOllyHyw0m1ci/jr34sg+mAO8LMi+BaIlQYWRaSi7ZsGoPwEpXrFYbYnE5JgBd
         C3Dg75Zm+8UnovTHzgajNCK4P9EXq8EVdNUO5rkqRtFkLQQZ6kA1xWUY+HpqMIFE/qhY
         FMnn6dls7PSXSj+8VQs7IrOFJe+yHRM11N6kVCkrcqq7RrW2hdvALRNsnIoZnmMCLBc0
         b4DXmjKl8SKJs3sDBQ+e6yIN9gW2cGbVac9+YgozYCVhGt0GNP47yCecYn0+HUmBTzGQ
         lvf5Ojiex2u4g+wljPwEIC51VfQrIhWoQ+FQkS5mCiEPab0ZhQoOa0NMF5Heyfwn1Xg9
         1eZw==
X-Forwarded-Encrypted: i=1; AKwUvBz9/DDk5HdDRSbDmjMFy7P5+NJU8MliOtIsNCYIH8SDv1MXSsO8JwLZeMgKikeyhf4pnXrTFcOs1CAImRrsDfEq@vger.kernel.org
X-Gm-Message-State: AFuF++kxZ8T3QcfC7qn7VXL4go8kst8Nzy/bpmQRAw8cNq5H70Ra6f2R
	65ppoaAtdWgzoNhf7vbR/ngPN4qt6hGQwWjJQRPF5/msMc+EdCztBFxC8sm7MUPgBNLSwSjKVUY
	x9GaCVCa/aQpp4JuwTO/4fsDKwO+jwKE=
X-Gm-Gg: AYBFou3vMm7GRjaJArSXMoITToobSolzcZQNys2Sq3lk1m30jombQmj0ensoM1oBIXd
	Z88eKb4PlGq5wXoSGCbkjEsGFoCdNTkK26+KZzRDAulxlhtA8uS5M1GKcI9xMXFQJ6rnycsN8iK
	Uc57oBsFuj4lfUX6f/V13NvKHrun1alxxg4RGkMuZTxPJx8y1djl0IRm6NRpLnRfNYYqgD+rfAp
	MPwgqFPXWvqI1Kzg3865EGoWnmrmxSbtu3Bs1n1jbClRXCaY+Uxlm3MzhqaKPumY08CjtLCGOCq
	rruvYvBvl5QcSSmFlqDP0Bb3ayYMTdCjok5s+MAUPXxrU3S+uLYUh13f105L5pi6ZRZhXYyeYW/
	kWAdne3xIfY10X+oLLBX7kDt8N6uvoK7CrW4zGLrXYpLXFQjn8V8NeLgl
X-Received: by 2002:a05:6a21:487:b0:3c3:9df0:2d66 with SMTP id
 adf61e73a8af0-3da39b71849mr6947233637.6.1788512022315; Fri, 04 Sep 2026
 01:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810051907.27136-1-phucduc.bui@gmail.com> <fe85bcab-0467-4cab-97e0-8427387358cc@foss.st.com>
In-Reply-To: <fe85bcab-0467-4cab-97e0-8427387358cc@foss.st.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 4 Sep 2026 15:53:29 +0700
X-Gm-Features: AcwNN1WTqdbmh2TSlvmQXAuzUgfnu8PThlxFIUq7F0eBJ6BcdpQVRvfvYmsXbIc
Message-ID: <CAABR9nFsV2dSbw1NSeVwoEPJ9YvNCLD9-D9vin+43LrCaKqWmg@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32_rproc: Propagate errors
 from optional IRQ lookup
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnaud,

Thank you for the Acked-by tag!

> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
>
> Acked-by: Arnaud Pouliquen arnaud.pouliquen@foss.st.com
>

I noticed that the tag is missing the angle brackets around your email address.
I'll fix that and send v2 shortly.

Best regards,
Phuc
