Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263DD1FDF81
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Oct 2024 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094537; cv=none; b=N2GUdUsWY/QO5DNIj66GrkhWNy1q5ODLdoqMzY1XlCaoc3DAV/TkJWzkgBhGOQxHub38MA1E1zpW+S9DjMjogF7CCpn1aAGShinkPmAJTtp62+u+uujIqK4BiibTzH5e6BsT+nokQwnd9tcU7U587Ir9ZQiThE5631W5HWcEg5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094537; c=relaxed/simple;
	bh=izfJPuESLdADVyQIKgA65BaWb+dPd/rXtKW7oYvGde0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLJhDqoEIXr266whIZ1D/R/Liu8Wlj9n2R5G/hdUh1rQhPjY8hIs+J/1JIRhOXHdrjjF2YVsKqzlkeoUHBjIwXBTQ4xUN6IILEbzJLh/rVqLcqPxCkDxOAKSdQoUzer6jd2lyrqQVs2eur++Tt2E8KjGucK68pvW+BNWgMlGKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lSBC/NJY; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lSBC/NJY"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539983beb19so7294791e87.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Oct 2024 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729094533; x=1729699333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUD59f78GtNOAlqBmjuglWzX0LStg1/+Dw/KZ/SMHA4=;
        b=lSBC/NJYhu1mXb4EIhJcUgbjb05G4kgqYouNihyL1ERmgjyOYc6woWimGAhi9pbJNt
         vJL85a2GnlVcLz2Y2hSpwMpjvIkIBkLKtL0LGaB1qzsl47gBNKNnRJfjb2TbubpuxSM+
         UOAcWXayhK+Pdwtfnpnmh/KRd5Dg2bA+x6i3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729094533; x=1729699333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUD59f78GtNOAlqBmjuglWzX0LStg1/+Dw/KZ/SMHA4=;
        b=qh4AQkFKKYYXh2V/BIUPymCBwugYtxcUtqD6KCZpMmDrxjvk9g1cMW9hBzciykhGZQ
         KtfeYsVMClWdZxVw9xIVxzmKUH4xrsFpwGY/yKnyfAKzIPujtu+DFCh8Y8g1QuOO+nOg
         v5hG+T9TGrWX4ILh+rQhmur9LTGK4X8saVy0v5EAEuDghNz9WQKuZ7O0ng++8reQ+Ivr
         7TQi6Do9TQMP6tfuvnaGXKK+TeQVtNY7OsdRxvzZh/+4GU/rZqNXw+M4Aj2PDMSvMR0c
         oU8TGbbNIubuOCupMYkvwjnVwoNHK5nvNt4wOLKlLc2gornXNL1F7aLamyNo8KeoSeC1
         IE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/NnDa2qnpYN/oORwKizaeutnloTes905J8hPlecIYmLsCuRswBc4Oo/unUwLr2VPmAFT0SRC00Rb3PBZJP57H@vger.kernel.org
X-Gm-Message-State: AOJu0YyGiDMLGF3ILtVCyCdL3T+LFQAipcPGYz37oztbeCeBLrrFoBoK
	+J+f2T5X9FISyG4bxJP94JIDAiTBLCxkHBR/NiBGj1M42o5baexIK6Uq8tAVZJwhDxLaMCMzG2z
	3SwjJ
X-Google-Smtp-Source: AGHT+IE6MaP2b0sPVZpDtgThPjuHv0AW89+CpUUGbr36bGx1qB5GAeyhT/YPFVBD+C9z9TqgLb+VlA==
X-Received: by 2002:a05:6512:b9c:b0:539:e817:967f with SMTP id 2adb3069b0e04-539e817a374mr7464588e87.19.1729094533106;
        Wed, 16 Oct 2024 09:02:13 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8a1fsm488818e87.54.2024.10.16.09.02.11
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 09:02:11 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539fbbadf83so4354723e87.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Oct 2024 09:02:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwc2RzgN8mnlC/64sRI41oaeYsq4V5qOvoDZNq+h+aykpRCR1P1rvFgEJCJzhq+H+c9RpxII24ZYg3aEBS49FM@vger.kernel.org
X-Received: by 2002:a2e:70a:0:b0:2f7:6653:8046 with SMTP id
 38308e7fff4ca-2fb329c2176mr77403341fa.25.1729094531214; Wed, 16 Oct 2024
 09:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819073020.3291287-1-quic_sibis@quicinc.com> <CAD=FV=VnQCO+y_wy=KQhK3wGwHGfO0+MQntgoPh78ZygcgNiig@mail.gmail.com>
In-Reply-To: <CAD=FV=VnQCO+y_wy=KQhK3wGwHGfO0+MQntgoPh78ZygcgNiig@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Oct 2024 09:01:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXm59wL3yX5+8-BKt+h+uBqvYKa-+y2kMo7SHdCqnVcg@mail.gmail.com>
Message-ID: <CAD=FV=UXm59wL3yX5+8-BKt+h+uBqvYKa-+y2kMo7SHdCqnVcg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Re-order writes to the IMEM region
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 19, 2024 at 4:40=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Aug 19, 2024 at 12:30=E2=80=AFAM Sibi Sankar <quic_sibis@quicinc.=
com> wrote:
> >
> > Any write access to the IMEM region when the Q6 is setting up XPU
> > protection on it will result in a XPU violation. Fix this by ensuring
> > IMEM writes related to the MBA post-mortem logs happen before the Q6
> > is brought out of reset.
> >
> > Fixes: 318130cc9362 ("remoteproc: qcom_q6v5_mss: Add MBA log extraction=
 support")
> > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_mss.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> As discussed offlist, this isn't a perfect fix since writes to this
> IMEM could happen by other drivers and those could still cause things
> to go boom if they run in parallel with this driver. That being said:
> * It seems like a more proper fix needs a coordinated effort between a
> device's built-in firmware and the modem firmware. This is difficult /
> near impossible to get done properly.
> * Even if we do a more proper fix, making this change won't hurt.
> * This change will immediately improve things by avoiding the XPU
> violation in the most common case.
>
> I've confirmed that the test case I had where things were going boom
> is fixed. Thus:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>

Just checking in to see if there's anything else needed for this patch
to land. Thanks! :-)

-Doug
