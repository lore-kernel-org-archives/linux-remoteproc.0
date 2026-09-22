Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FC14D7D56
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061200; cv=pass; b=V2kC8OocP6zMqetuF+IDcL0nqU3KTKRGP8V7N8TlIPMsJRT4T6lwA1xA5J7zs8hYRIizp2+PhFVzcb1GdhTLfhS+gEDuq9uxjLOjFxtZIXWsMtrFtDvey5y7GSeZfffD2ffMMGTGuX6PP6bC7HTAH9AIOVuvmYPeAPD/A+9x+vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061200; c=relaxed/simple;
	bh=j+A0Ms+9qRKBqkCceSavfxiFmZ1PrjaMnHMAUYBtlEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gahwEuvb7oVBT03FKNA8ZCr9i6RjQZ44NnVFiLpERYttwmVZdc3422tZ85HGRoyY4G2Y0DbsELWTA18sja8j/oOQAOWcdp27HcW2Tv0p0gPmg187jx7jhGzgpc14YKeq1F2vd5GzkayQolX+Kyb8UDq3LpnECDUcWa7iVp1nEg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5RXaH9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToUmctaJ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5RXaH9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToUmctaJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M75BsM1978627
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 07:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=; b=U5RXaH9duZX/w3Vm
	8dFrpKjYJnbM1wV24nKvWsykbt3UcnbvsNoFPTcmkVeGnj5x6rOZlUkq8fYcbeAw
	xHngJv6BMG9BIIFZt5FSv4UPDrw5cs94He98YLZM/FoqQlBJVZZdKEJgyMkvUs2w
	/ozNwweL+dN+LufLXpJD8dFeFhPxlXWM+BfvKzYzGxlU+hTtZWHDCkVYj9hUMIrF
	KP8MbnQnPX4RREkGfR/CiEaU+EJYDS2e090zweJ6xNZFUIbxZdi5/8F7YQhxvbGS
	c38H9pB0o2XI0PeSwChhbOmVeF0XwmjMpOjBQX36/oCTCbJM5/gD/hG45fHgwpvi
	90aJ1Q==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0hj6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 07:13:16 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8a0dd8f22a7so18096747b3.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 00:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790061195; cv=none;
        d=google.com; s=arc-20260327;
        b=buYA5B5nt/pFMTFVnbijc+nh1Zpta4CsntoJ5vSbhtMPJFKaYYj3x6d0kwbxnQjbdV
         0w815M6KF2aXVHY2niSAYuJgZNQ9lmEcc+18Sk0zVEyJQJhZ3eb/mEwWUBNZi5ePby1e
         M0CIrRMwABaSbLeBnNDx6nhsTffARCSZG/zoeYuk54dKDMUnO+Ls6/i4bvqVZjfnEN6/
         Tl0eGKhjbyf1K+A1/A1eWAyfOv+v0fI4C9LrYSd75syW7bucR2S44HP7f1cqboaiFXPu
         udu/uocfubbiPSqLhJMSL4FJvglAKMFxgdtWiOwQuCv+sHcu/ucdlkwHu2OEJndKmyVG
         LJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=;
        fh=Z+WZtM06uh0MvnKCbZ/8tDbbgoPnQD88ebGI7G6/Fw8=;
        b=qSCjaHIeMz9lNGyhg/7bsv0gfDQ9Zjb1rUUgfAjzCIV34Kup8uuIczmki+TMBlmKhd
         1mRdaK9mBRoWRISUm4N75nd7RF3KFxzZwSTyJ3OJoO7eXTjfLL3XTMW/q2+7b/eu9SV+
         nBfgPzT9Mc2Oy4sr08YYzh0JK04kF8vQr3MLDwBRSXe+6myJXH5aYhhjg6AY3A5R2/PX
         G99p6Bx6OIPaWwUNL+s9Qd2XMe5Pi/dC6HaUuryCFO9jrNiTx8QIYo7S6U2+FsePQjon
         dH0HdpO27L/PXzvajIZQscAuTVcZpkdMk+GolRphCVd+WlfRqf2CYiePdAaw+hEBPWjR
         0Jbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790061195; x=1790665995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=;
        b=ToUmctaJ7zETvBGycvW1XG+/V6s+9ppNzEcDqz0kRGiMyqC9MRnMq8PrYGzObZhDeu
         I3fKQXEw2kpqAuA8B3eXoKbx+IvfGdcngm29mfPL5x/m4d2dgIyQWp8LcPgioct5XHyN
         LOOqRCbSGTNTAU0fCUWrLWjyZPnFQSN0RGyTdRoC2t4JnC/KdbO66xvBGQuZ+nOK5Cu6
         HSkKaM4skc40iMmANn5MTcnNi17PGnw+0NoBdV5PCCIYKqi7yP74WnUXjps/WV6TIzZa
         36aSiCfuirGXvqi1WP16qCVAUkHDSPgbgetfT44qsU2gzrGM46eSorjihgGAmIcCL7Jf
         LUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061195; x=1790665995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=;
        b=cK/CDKsMim1XeKyc9YO1TmklYHhAyNNX7Gi2V1B/nGBVgrqIxio6z4BAIQq19Vo1Zo
         hucQ9NPXbRPE1oN9pyN5UuoT/cFBJYJh2QrJlD2AmJrWDO8umbETwB7F9m9C5YafcWMF
         PEaCEHNn13bg/jArJ4huOwv6b+az95JhYM7JYFvzeKmLGTY3kZ5AL+jbRRpU1w5zO8sL
         i9SVBhQm6Vr5yD06LoHYJ7lfuyKllV4ENAfp17/osh+XkmHiX2HLdWaiBtqZa6nY3Uwa
         QkvJ6BOAfP0y4nMRl8G+XVfb3vAiB9CokXA81F3qekqknoJpa7tra5UKqZKxxf2T739T
         wOCQ==
X-Forwarded-Encrypted: i=1; AKwUvBymQg5h+Ub8VaLEGwx2GJnfGCz+wkFaYWw/m6HgsvoBtKmivxJx6rCMwsxHCniEunuI94sHl47ReaeeDcuOJavC@vger.kernel.org
X-Gm-Message-State: AFuF++ki9s0MAFzxJK24y9u0kjNsacrv7VyOeGHZ9bQCfdb3aruSwTU+
	qIcczM0f0BUM5eCrrdLARugDZQoD3F+ZerJbpAhCUcwnA1sqO/78xLD1vucm6FNdC9R0BERnqbD
	DZw3h7btIxKtTsEaDsxCm6QvvfnDOJGm1i9P5v/IKjL/z0+NihhB7wboABFPULUP123iiZV3t8n
	taUhU4uhLjXIRL5GK6ocaVeFn6hj/Ag6VOvepKbDw1kdXFeRmBhD6qhPkFkQ==
X-Gm-Gg: AYBFou3EPLihZqqnhYKJEpBOHfjSMjtFu70VLo4qOxpwZuQjN4XdM6+CXVy6OlLp5xJ
	+o/o29dUtsvMMXptSp+IeAwXQ9FVhoL1bqKVcuWz77HKzDzCJv3FVtJ+b//yCs5J4bg+2CpFCzC
	KPQOdCEmTB+ESx94vrKrBvpB467GRw5ujqcQmw+SQk1it6ITdraWb1boDRng==
X-Received: by 2002:a05:690c:e255:20b0:891:f838:80ee with SMTP id 00721157ae682-8973266f5f2mr24275437b3.4.1790061194793;
        Tue, 22 Sep 2026 00:13:14 -0700 (PDT)
X-Received: by 2002:a05:690c:e255:20b0:891:f838:80ee with SMTP id
 00721157ae682-8973266f5f2mr24275397b3.4.1790061194276; Tue, 22 Sep 2026
 00:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920074919.3338358-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260920074919.3338358-1-mukesh.ojha@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:43:02 +0530
X-Gm-Features: AcwNN1WZYyoAGxPuzJzO4nofpNWXk2TMHZ4rOAz-NDcRfVNFjwdYEEym-pXugIM
Message-ID: <CAGptzHOtm=k9Yo+u0+uY+ZfHcoahOEVyvvp9BN0W1jGLFbhSiA@mail.gmail.com>
Subject: Re: [PATCH v7] firmware: qcom: scm: introduce keep_mdt_buf flag in
 PAS context
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: _V0YwpViUbJqqrbgtHTt9_HnrOul6oq6
X-Proofpoint-GUID: _V0YwpViUbJqqrbgtHTt9_HnrOul6oq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEwMSBTYWx0ZWRfX9mGc3/BI7PLv
 W35VxFRS+oMmr4kogJD3qPAfkipd4nFI80Q4RvQ2kIoEn0ABxboAVsMNJZWBateAl9JSk4cDTTX
 F6hMk/O6zQIhmJDb9xzKf5VQcqJi2Cu5VQE+vRcF4tfuizfs4S49YTzPaLvGrMasC4+uMmeVl6K
 oNwdn0lrUiqOYlvq/Ae2v5bmIE6/5tEuVaJywx9S5H4jjL4mdCTdYi4Y9R03ZYzdvShKWUY7LdQ
 6oTlJH7z159sIl7nERtMZDPHx68XJ93t76FC1/ksAiPWrC9NsBTNDTiQhgyNerV1HfKWpC/KdA4
 PvYycNub+tiWamlqbIRD479yBrPT5F7p2sUgInyogkknG198aEaumDecCkDRiMgMIe0zAQzf4Ym
 pNL7wuZtjGCVO85RGe1/ZV0Th6eKVSgFgIjlLkGZoOFMa71ju5T0dyRukhs5HZBG1fjMbODxx/a
 9Qk4xiHtxM7eGVWlukQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEwMSBTYWx0ZWRfX6Y5OCceGo+Vt
 oBGUsAckudDTf9J9JHL4nytomsEB5U+qDEl9MrZigN+7PUQR/Raz3tOkQie1O/0UPuS/W0kLL1E
 WA+xrhRc/IrTqnRFnXUCVjHXfJfmhbU=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab22a8c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2ZNwESTbfqjtqxM2Y3AA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220101

Hi Mukesh,

On Sun, Sep 20, 2026 at 1:19=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> The PAS image initialization path always retains the metadata buffer
> when a valid qcom_scm_pas_context is provided, even if the caller does
> not require it. This implicit behavior leads to unclear buffer ownership
> and forces new users of qcom_mdt_pas_load() to manually release
> metadata, which is error=E2=80=91 prone and incorrect.
>
> Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> retention explicit.  Metadata buffers are now freed by default and are
> only preserved when this flag is set. qcom_q6v5_pas enables this during
> probe for contexts that require retained metadata for subsequent PAS
> operations, while existing callers continue to work unchanged.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v7:
> - Since qcom_scm_pas_context is removed, v6 needs to be rebased removing
>   the changes related to it.
> - Link to v6: https://lore.kernel.org/lkml/20260805133759.2790755-1-mukes=
h.ojha@oss.qualcomm.com/
>

Please update the commit message to use qcom_pas_context instead.
Also, why don't we handle this case in the generic PAS wrapper since
it sounds like it would affect OP-TEE backend too?

-Sumit

> Changes in v6:
>    - Other patches from the series is merged.
>    - Removed dependency on below series by adding keep_mdt_buf
>      into qcom_scm_pas_context structure as well.
>      https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kern=
el.org/
>    - Addressed minor comment on the documentationi.
>     - Link to v5: 6/6 of https://lore.kernel.org/lkml/20260724182858.1868=
271-7-mukesh.ojha@oss.qualcomm.com/
>
>
>
>  drivers/firmware/qcom/qcom_scm.c       | 10 +++++++---
>  drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
>  include/linux/firmware/qcom/qcom_pas.h |  1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 28411a76d1bf..81bb38401d54 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -625,7 +625,7 @@ static int qcom_scm_pas_prep_and_init_image(struct de=
vice *dev,
>         mdata_phys =3D qcom_tzmem_to_phys(mdata_buf);
>
>         ret =3D __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &=
res);
> -       if (ret < 0)
> +       if (ret < 0 || !ctx->keep_mdt_buf)
>                 qcom_tzmem_free(mdata_buf);
>         else
>                 ctx->ptr =3D mdata_buf;
> @@ -664,9 +664,13 @@ static int qcom_scm_pas_init_image(struct device *de=
v, u32 pas_id,
>         memcpy(mdata_buf, metadata, size);
>
>         ret =3D __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
> -       if (ret < 0 || !ctx) {
> +
> +       /*
> +        * free the metadata on error or if client didn't request us to k=
eep it.
> +        */
> +       if (ret < 0 || !ctx || !ctx->keep_mdt_buf) {
>                 dma_free_coherent(dev, size, mdata_buf, mdata_phys);
> -       } else if (ctx) {
> +       } else {
>                 ctx->ptr =3D mdata_buf;
>                 ctx->phys =3D mdata_phys;
>                 ctx->size =3D size;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 96a2436b777d..40cd0f101a67 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -733,6 +733,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_p=
as *pas)
>         if (IS_ERR(pas->pas_ctx))
>                 return PTR_ERR(pas->pas_ctx);
>
> +       pas->pas_ctx->keep_mdt_buf =3D true;
>         if (!pas->dtb_pas_id)
>                 return 0;
>
> @@ -751,6 +752,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_p=
as *pas)
>         if (IS_ERR(pas->dtb_pas_ctx))
>                 return PTR_ERR(pas->dtb_pas_ctx);
>
> +       pas->dtb_pas_ctx->keep_mdt_buf =3D true;
> +
>         return 0;
>  }
>
> diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmw=
are/qcom/qcom_pas.h
> index fb2ec3be6a16..1d132e89536e 100644
> --- a/include/linux/firmware/qcom/qcom_pas.h
> +++ b/include/linux/firmware/qcom/qcom_pas.h
> @@ -22,6 +22,7 @@ struct qcom_pas_context {
>         dma_addr_t phys;
>         ssize_t size;
>         bool use_tzmem;
> +       bool keep_mdt_buf;
>  };
>
>  static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ct=
x)
> --
> 2.55.0
>
