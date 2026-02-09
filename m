Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045AA324B1D
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Feb 2026 23:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770678365; cv=pass; b=C/gIK95Y+AiAtLayfhOfRivjdGMKFhFe0aaByOK/tuptwC19WunjPpB+5pmZTw71XG4myFt4Vq+1ZhKvBye9auhue2PfVsK3yGo3Ggue4Fdu/KdaVhBh1tz1DsFLs0pM+TIcWiUbMQsZgxABoHdRkCcZs+ymHaloAi9BZox3Dj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770678365; c=relaxed/simple;
	bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PGZPi5hfrWWqcrGwOsXeFLFNFUMPsYkQF3If1MpMIjvxiUGiuXGpUBIzcu/KLc+kEYWIzfnCNzDu1SQRvI0pcpucfyGzfo5sibhiAOi33MrxnKuW9T4KkxVR1sw/j7jUj43/L3rcwJux/AQng8RwOPzrzxNtfEfrheEkbbwmojc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ujaqc37d; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ujaqc37d"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6729292dcd7so146081eaf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Feb 2026 15:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770678362; cv=none;
        d=google.com; s=arc-20240605;
        b=P8WqxiNYRRwIvS0TZP+zIccaFw65MKtJGdu0zG3arWfO7aaBv84aZV5BJFdr2sH9oT
         mW8zXDDyFsOIwg+xz9W9Pg2M+TyMuMzFw2UOEGxuXxQA2cd+ItXT23KXvy2+H70f4CUE
         J88vPr9BoyiFKEtNgCmHUWttEj6heJL4WRFs2Cz7094WYpz5u99b/VUImlk61s++Yy8k
         SAxsGEgK6Kt8hFFeWK70j4mMwafk2k5/bCPWkWimhcVTG891H1BD+6YXL+TooWaBU1tB
         IqwxZLexUI6ocL1+KjfM/duUkbDTCf5gkRfqXQkXlneGtcEPeAUINsYTQKwhr83jzELP
         sOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        fh=+ORG/vsch1OCCHBPOAWH9qTP8QgPS3jOqVFU0CAk+n8=;
        b=eXV714MBh2OfuytmrjV3uWbafESai7hD6UZ0C1OiMhiNvOk/frbG7F+Q3p9uc8TgQA
         CzXx/N5Ttmdvsler75J0SxYroj6czJInnqTY1CL0Jw3n9BcgbikILOWj3mJKRq5utzLH
         DksZPG1wpJPlO6+YajqbLZP1Ni6EXD2E3hzzH6Z5J6nNg4IBEw3V7i+YhoIqHQ9jRXTf
         md6KSrkiP+TKhoHLDQJyoIfc5jj3/aBdX5Kn7vyAVmVGknuyPbd4naxQY5lHgQKg1ir6
         zTXZQZOpXgoVAFYpxi8aqt5uZBuXiNOSTdo2x0EkCjUN8r5LfkGMX0g8pv7vqRcTmLUr
         WFFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678362; x=1771283162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        b=Ujaqc37dnQl2R5Yqj26hFvHbjrkkVtvv3gWCjC5Ecr1+WZO3N7g4EBLvZOP54cVaY6
         6x62DGnZb6lzyxmjWD5HXAEoTSCqmxUR5oQgQ3gSJ4wp+EF1bVoAvPyYYAx6zMwz1ixz
         FVbDiYe4M7VG0vFRbcS2WNe3kIAit/yPe6ANQZPeoUl8kIwt4IduA+Ag+HKUk+uWMHjs
         krKywhijR4qDlElkHf1/eTVzbJsb6wvpQ7p1T8Meb943tOCUUQYmzNd8dl6vWhvluWRH
         tHWbMnSeQvIcZ7Bi3NUTVxF3F0tuyULOROVqr138baNClehGQeHbS1OWvu1RfityBPdu
         LHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678362; x=1771283162;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        b=N4ZyfINZTV9kX0EQK8y8rWyFTxY4qu+PEowjVKUkpgiaNgf47OEHvuyJU4/7n+13lE
         Ain/otCpF7EuxKO2wlzuSt9lVyf+xdvmBG1+oM/wBioT6nLaSzUQgLjbCYlBG1Kh1fzS
         u0EF3DqKzvZW8a6ySGCHY33kc8SofcBrSNJwtn1YX6pjbJLj6cW0RrqmruyEeZOJU34s
         LSEekeYSfZe3+emXR9b6IdNyhQPjUro7JX1A+6f9AHDKJEYvCpa5A8br4GtkwUsBAOb9
         3LqBb3aass21yzF5HZFWIWBxj7N942AGJ+cw+cIOYFeXtlkptibofUQ6pWpNGu4CHVoV
         RgXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/xJykFEXxX3TC9XqKHimUFzQ62XB+SdUZVs30sSdMNXlsgVzWEMFcEYqkxlaD+RtQtpHIiRs8dNfC+VlfalJU@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlVpbWegQXtboy7N8a5hWPPCEHV4640OQ2W4EY9H1cvFPGTfZ
	oq7m5M3oyC3Q2JrSIJ5Np8fTl9C1v7a1ejMrfXg5Jl1CJlWzvp2aB3gQUFJwvL63Vt5F8I+K88d
	EpMraT+KLWg1x7jLwQA86szfjna40OuY=
X-Gm-Gg: AZuq6aIih+SpGUVG0EkyMlptbhTrHlEk/vqvTOjh2pgmSxc1WH1ZSKjP5JwAdqb2k69
	MxcNq5QEpWUb6e0J+ouk48L4yRhGdKp7Hd9SYzq4fBhl60Iew9h9+ip/OP5VA/YdOyi9qJavyAh
	lr1wI9+FObPozhPTieyCJslsjHLrYAR44sLiBqJW8hQWPe3mTkMfMI7eBBZouv3xkO8B6MbLFQF
	wgKFr2c5+Azur0Ic1wS8M/i4vSgGp2n+KEXDC3CftVhbhhxihvoI1howwnGrjbB1w9c8+Rql6QV
	6MUPADc9gB9uSCEmk9chISswPJg=
X-Received: by 2002:a05:6820:1514:b0:65f:6994:314b with SMTP id
 006d021491bc7-66d0d2fa708mr4985297eaf.76.1770678361869; Mon, 09 Feb 2026
 15:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yoann Lecuyer <yoann.lecuyer@gmail.com>
Date: Tue, 10 Feb 2026 00:05:49 +0100
X-Gm-Features: AZwV_QjCJogYNxSx58S_93uDe6N0OJjkbPA74xddnic2w5pObERjuWLWGj2ZiXo
Message-ID: <CAPZXbJmpAZfxFK9LKaS=wZXX+pez9j5k3gjF+CRPgP6Ru4DuRA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: val@packett.cool
Cc: andersson@kernel.org, barnabas.czeman@mainlining.org, 
	devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	justinstitt@google.com, konrad.dybcio@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux@mainlining.org, llvm@lists.linux.dev, 
	Luca Weiss <luca@lucaweiss.eu>, mathieu.poirier@linaro.org, matti.lehtimaki@gmail.com, 
	morbo@google.com, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, phone-devel@vger.kernel.org, 
	vladimir.lypak@gmail.com, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> would shift the info pointer past the end of the array for pronto-v3,
> which does not list power domain regulators in vregs.
>
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by skipping the increment when there
> are more power domains than regulators.
>
> Signed-off-by: Val Packett <val@packett.cool>

Tested-by: Yoann Lecuyer <yoann.lecuyer@gmail.com>

Yoann
