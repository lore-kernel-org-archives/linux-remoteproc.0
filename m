Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795537076;
	b=TB1crIVyC9ncKsdS8eclDOMArQAVqX96KqUbLTsX1rynlzdp0f7y4NH2Nw0E07EmbHYc
	 gzobW5vFcP78OoTwXKhLSaXBtNVQAHTvdW6+6/jLtKzcvgyINvc/0vvmRxrNBUfRdTsEV
	 gcgfvSAFkro0Lwhds6YnyGe+aty977ZIbfr0s/vd8ip4Foxtpzp2b9T6HBUeLzc9GkANK
	 y19sS46ZvrmW+NHrfVcOP4nATGo1OACMFb0y6Rv7A4ZWonABmPRm14jfBtzgWwz3vSSVO
	 uzwws+0GqIykDRQh/6S1lWXRGPYrb79R2luY0ohTJnAnKSR39Y77/JD8seHAKcsKkZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=q4E8NUwXseLszZ1OmnUd/Ct4ARQ8CaQkHgxGtTj7bqY=;
	b=tak5cX8IuJxjdwR3HokkvH9T9Hq2aHkCw12PjCmnLqmMPjgixwdxJLTCu9QnJpNoRVaw
	 dQuRmBiKq58Wp3WeDHeGVM4WA9EHLfeXf2zHK2U47gSCgTvs+9MQxFDYGNnKtzLlXZPf/
	 BmArWlhMVL9ao5CEqRou1TRLu+JR3RcMuWf80JILVKSl0U/Un5tnbN7CuviYYzgZvnRPs
	 pdiSyeoxL7o4cBoW2J+/ElSwqtfpShVf507WBi/rQpHXJu/PT0FcYKfyhBXek1Z0usOs9
	 OSMsPY9RD03jXR6eq3AVismVRf8kDTGuTo3AY1rwd+EDm+DTlS05QfeVLb+eDA2i8wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZbKnVzYZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A6606A321
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 16:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828A6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZbKnVzYZ
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4efdc8c20so28555757b3.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 08:17:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795537075; cv=none;
        d=google.com; s=arc-20260327;
        b=a/OeUlhUJ9taGX7+PUcEDb2qdxGqfyL5Ita4pZGvgENszfpFMsdPNHyH77OZ3xpHdK
         Q/fq8pNAzIMIGji1BLljbAhICLQQZFSA+FpRRYacbmPwAAQrypbd4ePDWV0k91u7Lo53
         nNMKFW7b9JN58iQL/0abFCmK97mRwmXWk1xCxjFiry6vQm/Pr7ztc7ePb3TnJ9qAY5R+
         /lvS4/90O0HsmZJDZ6XUni3WapL33slhaPJHJGLU+4tb5H9c18oRdeljQFdsuZLoTda7
         /hrP6uveUWP9U9+FnPmEc3CgNjNbIwsFcH89h/H1XvZNFHORP2Zx2wEmkcHS0TABjt/h
         On/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=q4E8NUwXseLszZ1OmnUd/Ct4ARQ8CaQkHgxGtTj7bqY=;
        fh=bON0WUfa9cWaxcteCCRlL+Wu/68tH7r4eR0F1laQMSI=;
        b=Guhly5MOJgiy4TYtW3uxd00VFgMGoPuSCpDdVySUQHNNJ8B0ORonG3bPvrjd/M9QzP
         rxjaw96NjIYgMhJV5KAn7HBrK46C2suKSVuf562iv3D7h8agOfSp1rf7eKw7AQbbJLz+
         Oy1DDh1+BDyIo2tbo4IZDLiwr5/TcgSqfzjY/jWA0yxUS6K3X+tOnNgR6g57EFvBitN3
         vICS85EPZydQQnIOcQRCoIzzU0SzrIZFyZ4Qht0Q4NBr9daGqFbHSwsLU7YGNQ/A0xcK
         B+9vhKRE92D0iTxXQxx21Se4PKK/6lm0XyT9XJ0y7PIE0BwT7rHfqGlhlWD6N2vLfOmS
         R28Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795537075; x=1796141875; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q4E8NUwXseLszZ1OmnUd/Ct4ARQ8CaQkHgxGtTj7bqY=;
        b=ZbKnVzYZGjFHhy75Mv16O8wj0+2XdNPsfY//66WBcHqvrQlqTox1xuNfIb83EvAxDi
         JSCklr+cT2+2FCdaS7KxJzWeBSePgb9Vc9krfgjUK/36YsPWViu3lD4gy44Emfs7vLCG
         KHBriGMj0RWCiukNmxTrUL7HMwrDfZjJX11iqLUj4lRHJlk3GQE5oM3DMMLsjUMIVHhg
         +RiYHFuxC5VMQHcxt3dfq8g806vh8ejGIhumJR+8SuhkSZyOuFVVMpy7NGp6R5/4Vifz
         IOpTgAQ9SCPrkMDQ4GRJxPV7hccyHniv2QQW2E4GL4Cn28NwJOeQ6tUmWGczBmFi6gnb
         URvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537075; x=1796141875;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q4E8NUwXseLszZ1OmnUd/Ct4ARQ8CaQkHgxGtTj7bqY=;
        b=qkmvaL8Pbnuyz5SDVileaaeuN00z0QRqgzcBcVGAvCHbQzXG0zZBuYejLLQXYGJFoL
         BDqqUlzcfWOtxqx41WYUCtbGs82kjHdfv3wQlpwcE7jFdnamkuH+8XOZjmpi4aL2jAIn
         eH9NtBBR7KrSh5XHT7sFwegaJKcGI1Muo5CnREYRZnvXEnNyWA1kGK1R6SxpzixDQRl3
         0nVvSyfmrroxnm0bDsDdd7SaK8losROXdWBhAUM+KPKRMZ8YUZOSAC5Zcjz7rdRxTpUc
         +swTQhVpbdY2oHZm5N5vyhBfwRYavxvbvpMiiiX4ixqeC8cTZ6CuDWm8CVsQNz1vTSK9
         L7Fw==
X-Gm-Message-State: APuU4Z95BZqP1IhM8BECFkMGppAcZOyUuiR9XyKRgK/js1D7xOgxXsah
	WaqdfwDpfw308BgGS4yqjmWa77RJjvACwXlIX4adlJGeF/2annlfFLgQJMMSFRkl0l7P1do+46f
	bOEK3Md+WEEBSnsuiN9OIcONVVqe0PVJBI8XzF5ck3X34ScUz1mNGmXM=
X-Gm-Gg: AZFdTZdzBvg1JsslINEPqgKDeFoTb40Y1iCveo6INCJl7PGl8RG7G14DXQBHM+gtos+
	g3XWcB3kwYADsGkQ9qKExJ5QA+KCuGtGvHGLDZMvuOa6UKJyovvR0BOfKW46JlImfnOyamUhvQq
	viY36r9MRm2w0cpek7A2n1HQonCmoqQVpsDkpXOo8IjaaHCEa2X7wDVkBXwPvquy5jGnf9cyjJy
	VRhph02G1XSrsA3Ejg0bVs1PNbjh9fXDPGmQjkAnqvgEogBuuG6ud33DpESaNiXSyxTQAybh2jq
	aimsZ9CU+UycHuO4MlGXqJrR7sfD++C2Rfz3SBpMBhOmvslL6cQsCvlrYUzaFsy81ARjX4T9UDz
	9FhT7uFQQhW8VizHdcu9Abbgi8hVrFRr9Urc/epR2Hya0c2w/ZjkUlqZukFl86s46qQNmQg==
X-Received: by 2002:a05:690c:886:b0:8b4:d9d2:df93 with SMTP id
 00721157ae682-8b52045ef9amr67879477b3.24.1795537075089; Tue, 24 Nov 2026
 08:17:55 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Nov 2026 10:17:43 -0600
X-Gm-Features: Aa3M54rkYA0QciL5RtdBSzPJvb50sXoKLYTMSpI4s22vlnvO_QzptPnWQuPqZHg
Message-ID: <CANLsYkzffWooSxVK0HWxbukU_X-HF1ZtVGsFhNAt7iUXdKW_Uw@mail.gmail.com>
Subject: [UPDATE] Patch review update for November 24th 2026
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Good day to all,

As you may have noticed, the remoteproc/rpmsg subsystem mailing list
is flooded with AI-generated patches.  Many of these are complex to
understand and require a significant amount of time to review.  I will
prioritise reviewing submissions written by humans, AI-generated
patches will be addressed in time.  This does _not_ cover patches
patches targeting Qualcomm support.

From hereon and until things quiet down, I will send a semi-regular
update of what is currently in my queue.  Here is today's snapshot:

[PATCH v2 0/4] remoteproc: virtio: Fixes and cleanups in the
vdev<->pdev relationship (currently reviewing)
[PATCH v2] rpmsg: char: Drop messages that arrive while the device is closed
[PATCH] remoteproc: core: Format firmware carveout rsc->name with %.*s
[PATCH v3 0/1] remoteproc: k3: Merge ti_sci_dev and ti_sci_proc
[PATCH v3 0/2] remoteproc: k3: Recover a crashed remote core
[RFC PATCH] remoteproc: core: add KUnit tests for rproc_check_carveout_da()

Backlog (AI generated patches):
[PATCH 00/10] remoteproc: Assorted bug fixes across remoteproc core and drivers
[PATCH] remoteproc: imx_dsp_rproc: drain the vq work before freeing the mailbox
[PATCH] remoteproc: debugfs: use sysfs_streq() for write parsing
[PATCH] remoteproc: omap: Fix cleanup after timer start failure
[PATCH v2 0/4] remoteproc: core: Fix the error unwind paths
