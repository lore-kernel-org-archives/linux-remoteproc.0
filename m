Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581C011718
	for <linux-remoteproc@vger.kernel.org>; Thu,  2 May 2024 01:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714613035; cv=none; b=uo9Qr96jSUfE23ZSIBDsJAC/UpAHdmeFnBvstsw+IV48YyHZImXDbjr7ldTbv1/IY/VnRJUMY1/92OwUdJVEFgfrRUOkVqVJ0iq4YPNz5fWjMGLi6R/I83sSlIv/6w5dxEQ4C1OCLGta6AxomRO//x4FGlIZ9RNdXm64PphaX0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714613035; c=relaxed/simple;
	bh=5WkPVuKqbuFm4ZRcDTnLhlyrVQwJDjrUhpZ1o3Tb55w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ijAHuiUftcVPWgz3mAFvFtTcs6X6mVtl5Cc+4XYNBZ/gKkUtzG17dDoa/87I1vkI6NQYFkSlqQPLEJGToaH4X8suJLgpzHp6//MPx5uWCLUBT4jVGwm0w7Ko0zKpwE6te7wj0GLOBQBKeJ96YbJyzRoLHzG0ofRJ+38wSuBuiTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KBSBqDrf; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KBSBqDrf"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e0a0cc5e83so44397301fa.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 May 2024 18:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714613031; x=1715217831; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5WkPVuKqbuFm4ZRcDTnLhlyrVQwJDjrUhpZ1o3Tb55w=;
        b=KBSBqDrfjYBzXNAZes1y2C+3XEJaVMRy0rH+Kq7Blusc3us/1KSsCslanNAcb/KHBA
         l8dDzpaDWHvvmpCrKTuxocevdkLCqB+++K2tHh2FAWje8hUIn6Uh+7dPz9m7q7tgG6pX
         Yg0nJMNVD4VkNa0lWmdXq2Z3F4CnijGUUJCW2Up+poOO2oL3BXprOFM9FQC8lyTAzlP1
         lTGL0BYv95IE7k2E9vhS1/fdFgK02ZC9Lv42jw8LvdNX4GXfLZXtDVPfmBgaKcwrPS2A
         nd5mUEbLX20QqYO7o00Rm7R7L8b6AjoIJ7vDjhAtQVLU8C/HwLNzwxysDuQ0pXTb5tSG
         XIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714613031; x=1715217831;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WkPVuKqbuFm4ZRcDTnLhlyrVQwJDjrUhpZ1o3Tb55w=;
        b=vCwigFpX+fs8lNbJ/PCjS/7USZd9DmZFT2EvENr1E/s1uQpGVbBzqbvHKqTTvtJFC1
         dVDvXIelMWuA1IPUaL11VjHQ1G1MLKm451bzNLPyfdDaZPsTpKcKXQlo6JANXqWZbqRS
         eOkN+4VUsxve/x9ODMBzAHFV/B/2/Z+cqqODNRvv/vu/OCry0p+dZi2Hbl8xv2B423LY
         PPFNveHK2Ydl1Y4DNIs2xWdFJwlNsPVJv7nttm0r02OEo2JTdbb0LHLK1AkIU23+PLF+
         UeKtfTcIaXoxRzCQcIGKiaLN/UFVcLVGHznWWLkCkYmzsqQY+V4gyD49k49mfK0fAIxD
         l1GQ==
X-Gm-Message-State: AOJu0Yw0tiph1FgIdMoZJ7hMqcLa9aUeWxWtS90z4quFSwMkMboaA1AF
	GHzxu1BS7Gqtv4QTtMXB1V2iRGKTtZC+qO2z37HqQabLKe/xhgWxyAJbhYeXQwXcBcnVpNSQ18b
	4Jkzh4U1IJKEGYaUQRSbWVLfDKNIIbnDtbUbtsJHavgR8Wv8iSLo=
X-Google-Smtp-Source: AGHT+IG7e2s5Za3pmmBTmMkrwLUtpB0cUrQtmJZm49JMy7VgCFGRwlMstoTWx0Ur4upZRXdL/uNHrMrvcnKMb9/4LNc=
X-Received: by 2002:a2e:780d:0:b0:2da:bbf4:81b8 with SMTP id
 t13-20020a2e780d000000b002dabbf481b8mr418511ljc.14.1714613028955; Wed, 01 May
 2024 18:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 1 May 2024 19:23:37 -0600
Message-ID: <CANLsYkyUiU9WoWwU3Lgjb08wJqXOTB-fn8_xi10dbqdtkOxzrw@mail.gmail.com>
Subject: Remoteproc/RPMSG patchset review order for May 2nd 2024
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH v9 0/5] TI K3 M4F support on AM62 SoCs
