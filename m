Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB84A391851
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 19:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318236; cv=pass; b=aKE65W9SEOXuJBl0xMcUP0VFD6fH8iiVxeVXMoLBsIW3TIlSsu0D+rHrvl/+D2NBOog5Jb5cotw9IhGZN9I2ulWOfvZtMgLBVk68R3L2COperbkSYQeIfMaFc9Y87mqp5frsWzY6uUxkIRc4ES9ujrmUHAoX3vPyo0MIx7cCcyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318236; c=relaxed/simple;
	bh=uuOeXfineAaSKEkzm9ZAfY9YAcij/EcCbR2zNaGpEpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktFDmYhqYjlkoqRLE/KdxDR3PWvkGjIEriW2wmYewWYbOHCub3V2o38Q4lMBbp84WC6X9UxqK2C/XdQIjwpSCPVxqtjjwX5R8vx+RKgJu38nU4Bi98ZYRcbdIzk2wufdI3R+papCHk2iIdpe3ExylHK4/723nkRaCNsPnsY9iKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNyTUgU7; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNyTUgU7"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-80c4d1520c9so7412187b3.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 12:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784318234; cv=none;
        d=google.com; s=arc-20260327;
        b=F6rc949wn4nDCAUC6NqojeHGnlkh4dagImSDsUgFYoLZU4hv+0P/PmO22muNPbODuc
         dOTM19NDXfU/4VkPa7PMoJYeBzo1F7Z06zOUxwl5dmyiuN58sxPj3GKm65fX3X9Suxko
         E0p7YNAMsNTjfeAwja3YuINuRtlVkF7axzjsJQWBBcHdATgkkwi2vZCZ2ODlf+a0x10q
         XDBPCzb8Dla6qj/djbw3LRqv96kI5zbIof+lr0JaJQ4bfzBHdRmqvoxHTMIUp3EFFL9X
         ssIeQJ69bfWXcTYmL3eu8d+sicOwQCTd/hjTUmTGx3m9WzzX405A4eUccRhdJS++7Gyt
         EWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4r4qpI7ZYUqwhCzIi/TmFSyDrOhyXUmyBS8Pxgob6U=;
        fh=mlu4cKR3yiMwTAsPEEBsoO99uKLbXE/P5vaTb5rKMuk=;
        b=jznkWGvjYSjOLwopaQeTyp/EoCBT6rIeVji6andwGsdCDGaWtODAq8ZlpLq7Ygj4BE
         rTkfr5FY1Qv9llNWOqiyzY5r30ICDNLzYPcYTV3k8pNYZREPl4ZpGobd9pUxB1bu7W2D
         UKnlyjiR1SBpyK1Kg0cVLP5Mk4I7GqT9xw4EZ8dXbz2BofKidWyOlTj217oRFJK954bY
         fKuSC3gwSMGaDS3KRbf5U77GabtvDIPyUgjvfxtzOkdomtykg3CIc2ds8Bb/WfuBC3NH
         J8qDK1g4NR88fZUzk4FqFeZrYpixaR0XuhwoOWvQoN3/u1ABYQBD8YY2Nan990gz5jBd
         zMaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784318234; x=1784923034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4r4qpI7ZYUqwhCzIi/TmFSyDrOhyXUmyBS8Pxgob6U=;
        b=eNyTUgU7+U1nHHE1U6fzUA7qpVfYDsJJijHQjAeZO0w1wW7uOJ41TEqaFbAzE+BS+d
         d09C3s/Z1dhWrBSqEyF03kqvbjLIM/edSCUE8o7HIPrVfHsJvTKWnC0huxT1dLsXvjGn
         LJDMiEJleiYcAZp2TTXA+q+tgxucslh4QgJdjVLJtCuTeWKyzrDDMc2HjSFsOLGMks90
         9IM6kIdiSI+vno4ut+CVj8hnqDRSLWEBll2k3SovxxUB0KsyTsP9x534BwlcxY8YCpUt
         +yXwacWfP/aKsYHUvFPncVjv3mlzzSLzO0FuCyiEdBnHVOqmtB/pZk4GKbzV2qPP2cmI
         xo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784318234; x=1784923034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4r4qpI7ZYUqwhCzIi/TmFSyDrOhyXUmyBS8Pxgob6U=;
        b=tKESW4/MlRTPIYDfn2nsvx5/xTLdIUE6iY3/8lQtHT85X2BrswaROMdY1nS76NdMda
         AwWnorlFifkrddXgll3Fz1mM6O8ad/cHvRJbcN2MvmVbm5B68s81GS5pQ/Wqy9m6B7gF
         9Ov1flPoLjxGpOhcLHHfeQJXhPvFaQo+XkCMmfsv6+HOQ4dk8Y2PXpaH1/NbjiLbTpkm
         cOtJifn5WT+wvya7+CPzEmf5KGKzn8Ou0BngHu3f7djY+4ZO8Fk3e70hntib2ayvjLJJ
         /rg7J+55Vw79vl28PvnBKmTFm3+jW7HLiuTbnKBntXDHtDimcHf79K2Qzr5wPmMVRcS8
         /zqQ==
X-Forwarded-Encrypted: i=1; AHgh+RofjTAzLXEvWRG3pDNdH/S2yZ3X5+QIzcknlfHRC8+N13WdLlxilnN/ZYv4apmmWLxm1f5R4FM/JscFpzdPkSkG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywog6xwiGG75Z5VlZbMBvx8ovHPwZdIo0NRkLtgZUbGLBmtMNHJ
	DAZzNPsthkNV+aghpoTkk4Bm8UecQmlEbMUK3+8MuH9CCbImU9tMkVueoU7s7YvFcZBrXAvmr4L
	RzJitasTQh+9YDJegIkPr8D7eom7eaCU=
X-Gm-Gg: AfdE7cklCzP4fatmt5nn6t/SqD/QltIuWojws0GsMJgpzb3NLfB6itRoGi2fGVByzhD
	cIcblvuQODmYTWn2YOZY7rppnMbJ+0eNOxU3xThB0vh7vYbnDVeX32D2nhAbHJeQheB/HupgNwM
	6seP8bvOQzNAZt6CsqoBbl5LzO+SFsPXOHq89CeYKsQIkVUv+5G4MRvvMt3nsx0mnOc8qcLu1cV
	5JgWhTMb1H4FAcJbtmGO5XU5iLm6Skh4QvRUfmQeqxf9oLsvKcjxC1a5MQgoT6fPFsvr0rQ4Cw=
X-Received: by 2002:a05:690c:60c3:b0:80d:8bad:2ceb with SMTP id
 00721157ae682-81ef217a008mr13797247b3.0.1784318233761; Fri, 17 Jul 2026
 12:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com> <bc13f78b-287c-4832-b2f1-a68e7b35b57d@oss.qualcomm.com>
In-Reply-To: <bc13f78b-287c-4832-b2f1-a68e7b35b57d@oss.qualcomm.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Sat, 18 Jul 2026 01:27:09 +0530
X-Gm-Features: AUfX_mybpP0ipFenvhQ7910IFz9oFbDJFCxR2LMB6JHjtp_vKzBdXraXDoqWrzE
Message-ID: <CAF+TLO0F9jQ0+pPei7iFDqcC-gKd44gc5SXa-o_dBKzNsHKU=g@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in
 regulator error cleanup
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	quic_akdwived@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 7/17/26 3:01 PM, Konrad Dybcio wrote:
> The first two labels only unwind a single regulator

Thanks for taking a look. Could you clarify whether this is a
correctness concern (e.g. the fallthrough from err_enable/err_set_load
into err_set_voltage not doing what you'd expect), or more a
structural/style preference (e.g. avoiding three chained labels in
favor of a different approach)? Happy to send a v2 once I understand
what you'd like changed.

Thanks,
Sailesh


On Fri, Jul 17, 2026 at 3:01=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/10/26 9:46 PM, Sailesh Nandanavanam wrote:
> > In q6v5_regulator_enable(), when any operation fails for regulator at
> > index 'i', the error cleanup path unconditionally calls
> > regulator_disable() starting from index 'i'. However, regulator 'i'
> > was never successfully enabled at this point, resulting in an
> > unbalanced disable.
> >
> > There are three distinct failure points:
> > - regulator_set_voltage() failure: voltage was never set, load was
> > never set, regulator was never enabled.
> > - regulator_set_load() failure: voltage was set, but regulator was
> > never enabled.
> > - regulator_enable() failure: voltage and load were set, but
> > regulator was never enabled.
> >
> > Fix this by introducing three separate error labels to handle each
> > failure point correctly. For the failing regulator at index 'i',
> > only reset the resources that were actually configured, without
> > calling regulator_disable(). Then roll back all previously enabled
> > regulators using 'i--' in the for loop initializer to skip the
> > never-enabled regulator.
> >
> > Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and=
 active regulators.")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> > ---
>
> [...]
>
> > -err:
> > -     for (; i >=3D 0; i--) {
> > +err_enable:
> > +     if (regs[i].uA > 0)
> > +             regulator_set_load(regs[i].reg, 0);
> > +err_set_load:
> > +     if (regs[i].uV > 0)
> > +             regulator_set_voltage(regs[i].reg, 0, INT_MAX);
>
> The first two labels only unwind a single regulator
>
> Konrad
