Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793341462;
	b=bP2JY9A6xCidJgAuhrw7yyxhwc37MuajcZ0Vupqrw+HR8DhDjW6VKL7nlfCtqWaQEQPG
	 kJsrbshTT3U7xMN1DUpxdhc7RsGxxKE0KQD/guu/5PKw/eWeYEXdzElB4EdlDNKa7xUtE
	 C6dxIoY+7Yu6ydTk7A10Fm4riKfWwn/238oT+SEVf2kqLWK9I2gU0TWfnSAN2dKq5vlsj
	 97Wif5YYanoPX4wot2Sp6S/ubRbsOB2+fFMkpK5jHECkgOmvy4hd+BbSIPnt+148aT+EP
	 t5IxR2SD6MmT/anD4BeK46w4jMQlwCUX/8OoZuT4fa0cgqJl4ziUeWqjSNSJBRcer8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
	b=fT5qp1k7ID6T3Xiwa6ONvN3BLwy/da0FRbHXfj7Q1TtakojEnyFAYoNlFH2h79YkS7Uo
	 PHXgbff1ig+AFLsJIZtjaZwrjqoQ8eCtVOQLJ87Lf3osFBJBTVA5j3JwOPVYcSswL1IQo
	 hGHABI7tIE98tFMbqOHTo3ZiAANqcJo6O9FtHo8lodvGmE/vPfwNmDHJ74lNWaRQy7gbG
	 wu6WWfFnlEjEmULDntrG2ffPQp4FEDeHacG3VxackJlRbWu/V3gWNK/jJ3QF7B1EsiSoo
	 K0S0dYGMUWz8ovBRsm1KwOiVkkcYS4WX+HcJ9NrmrBQEvPDMBrS6QPqja8Nwf7g8RDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuEHxYBg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAbj+QKG;
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5233606A31C
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2026 06:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5233606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuEHxYBg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAbj+QKG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F7Uj2871198
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2026 06:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=; b=LuEHxYBgHQHc1NIO
	uuv5vmt2LgqZyRzjPVO9Q+0/Dt/10NaSUl5x6VpJD+N35waWAPSjPe6Qyt2o2ja5
	n+ZibBlzR4T+xRy+hEJeGWnpAyZTr+VX1uKe5TF5daTHWG+LDZOcCdEOZjQ6dp1k
	GryHYUwiYvDwf7Gs3lf/jWorIonIk0YoFQScQ+7w6p+OewSqPluAfOUE38xKZBlA
	2hhulziHffw6tDC5BJjvruIMBvXjC7Mq7snx+5t2okiLEDtW5e+pPC2EwIPKJoB/
	MTqSkXW7dzzopkA4J1KBM+2WCnH7D+kLH6BpGaRbJ7GOK16Cm0Np2h/tvXJdEyfl
	oIMubQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhjab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2026 06:24:20 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6798c4b8894so452619d50.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2026 23:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793341460; cv=none;
        d=google.com; s=arc-20260327;
        b=LyfYKYEYgNbf8JIdXXXvf9dnT/17ocuHtJVVfYNRGIwZdWb2Yisa5Rt++7/ib+U+kS
         qYLYBtV+ccHBm0wcxhNltxUtNYnMV+ZWZsvCBE+yROhDF5JSxjbn6RYYbieWSgvsgRia
         0Z+pHLscXAYdNzH+elgGSmN25A2CyiOh+u27wprTZNWcvedQRy93QkfiKn61RhzxoUOt
         e3SHcUhPsetP2iPR5a8CmTfAdG0cgeOZwHUmxM5DaBgKwSBWqROKt74cZmbTEifkU7FN
         2uhQkfBAvdmpfO9lwR7XqC380ocPPeORb1eQj+7tW4ZzqOVyYOryJgP5DlsAUQ95VB7t
         6w5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
        fh=NEMufUcmwpnbEba/Qw4tm2PsSUktP6Fql4dQckecVUk=;
        b=Qa1Nnmi/MJqQyWhcA5RIXZnP1c5um5WTgXLogoQ0LzxSSnmPyy1oM050XZJaLmhhd5
         lzci7froXkzae+54ap4w6ZhXvpjzWbBFj+3ple85jiNJXvoKA87uGUQfgLPifKVCawmE
         Hx7fXbDjnsD8qgUnu5WlyG5lCiwfVKppV1yeOs2OPw+I3DmhKMqhZmEf/tcS6QgW66OT
         s54+JPDTo6RrjI3PHAAg9ctwYxii7uMGSFxtxQdriiGFz8gZ7DWo8eruHkqjaDvc5ccI
         VBIgJhnVdnBDO9wR6SNGjGeAIBKySTEa539aZvT+n4v1gtnQdF/XQzpzL/XxzYtdAQaO
         xxHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341460; x=1793946260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
        b=ZAbj+QKG7qF73GtYJQbKX6MGckqODOF5BfpqXC3yCY39XkHjx3MYULx2WtflowgwvW
         WpxczLViriSg/iWx91D0PQeftcVSWXuCdA7LVu6GLQjNJjNK41kXNzaIYFzPRquKAzam
         zwvo0+d9uyE+Tz/Xegwxju7ZtvuzShIqx9top3TPJS1Grs0/AzPWZSK38Ivt1vN8PjOa
         ai9/s9X6JDnihcfxftLGadjmwoOCaX2B8BBiIbIwdx4C0z/ih7g/NnyvK/L8k8HHtQAB
         QmZXvEnnU25jmji9LlFGbhM79v00E13bKcEwoEIMkOxXH+ySrkWCidhd75Ys3noBdP9s
         9AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341460; x=1793946260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
        b=Y9LEIpvOkxiUMh08lPHnGz8YLrTqHuXNmo5KqVfk2rsi7gHMqrC90xwT5+VZAjrid9
         DnaoxG2Lrssu5X3+PAnXS/pRFIxrtZ2d+tkq4PSTnst1fTIY7ocv403+UfhQ2eSqqrFC
         v0N94R8owshBao6CYVqY6QkAOT0Qk3qWJ9TtgsataOLUSasKnYDR0gD7EcYr1LwsSb8s
         48KpqhHs9W1Cy8CRgfyyl4CinjQhtdG3OJO6dLwXG6tFPGE1LvN8lJQQwSEpSPhDiBuo
         Q+0e+tSNsBl8vUSmx6B3Y6wXEyTZrP+8sbcgJS6pODIyzaHKxZ+H28SPM1PzarGDtOtC
         0q7w==
X-Forwarded-Encrypted: i=1; AKwUvBwAgBSr+sVF/3Rpwj82M1QR/Ww6gaevSeD+th3GPDzzaUW84FcwfTM/EIuCUxE44yfttusIM7JI+EX3d8DR2/xq@vger.kernel.org
X-Gm-Message-State: AFq9FYLh/aUlkK+i7wIvDfrGZNNhY2IeQlpiHgbWz152yBZhOJFjnaPu
	1XvA44zMqKBtMQCeoMbhAOppGQ8L9Qy3x4KDbU1nJI4NckE1HN7PppDazWK6U/myYCo5YpqSCGf
	N9sf3KvQburTg3Yf2gUbkgS0xk3ivBFhp0GNDOEPizt8agJUHIp0YRUHgeqUOfxZGYu/H5acCiO
	6zdtaK3rIOf5UXtvex79LqAoX58aM9Lttk/q7euD7xCBW6oPxH9iX98Kv80A==
X-Gm-Gg: AYBFou3ETvpnxaoTIS6XvbO9wDNkgNGvnUa8Byf2xGxwkwiJsb4ZpjcvnhrLNbp3Pu7
	wl53Rck9EjovuOSbU/4N1dW3GsinqEMPxcceg5EYyGz86LIXHIe0L84kmhYeb8PS2+G7BKBwqxB
	4YRiv1xcnkReAhzi8/hE5eDjvq7rNsX2TnOoPxcwrKi7wdbYQewA/zT9JUGw==
X-Received: by 2002:a05:690e:4550:10b0:679:b0d3:9f20 with SMTP id 956f58d0204a3-67ba4fb3d99mr747477d50.34.1793341459848;
        Thu, 29 Oct 2026 23:24:19 -0700 (PDT)
X-Received: by 2002:a05:690e:4550:10b0:679:b0d3:9f20 with SMTP id
 956f58d0204a3-67ba4fb3d99mr747471d50.34.1793341459389; Thu, 29 Oct 2026
 23:24:19 -0700 (PDT)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:54:08 +0530
X-Gm-Features: AclHuK-1O9kBYPNB-LqEIyi8GfpH3kBHDVYJZq_uPVEaaNQf57NjdphrRbcepus
Message-ID: <CAGptzHMSY-fZh+0eOqvU9kX3hyUh5HOH91O9RX40=az5YLWqyQ@mail.gmail.com>
Subject: Re: [PATCH v8] firmware: qcom: pas: Make MDT buffer retention explicit
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXzqN7v6CWfObS
 IvzUlni/qrLyFaQZ+iRudxDO+gDICKpp8nczR4yaMfx3rkA/uaHk4P8ZqDWVckuudVmVSj3WJxX
 VUDrW7TOsaMUYKxkFYO4butp3HW+DBfBKyXSRbJPgV56eXmOltn0Rgc2/h7Vl/MzA//SYzGjLZG
 FOIBY1HceBeVmdhKSUXxbEJNKjzqZOYVBNwUtDrhxO124y8/Xo0mLDvs7XXNpK1lxEXrwxdFnLm
 uDfkhrZkk9lQ3Es4EF4iqbWdzw9c9NT/lZ+Rv97zD4UXaHOiKDgH/J3tomi3CVW5Ukt79xOkFjS
 pHSplINbk6FABrVCunRUp0Wwx3ir0lB3rm0pPG9uYcE3zmRHxz0IsN1OQ1LRqRZ2wf4A8RfBbtV
 LG343d+fBIzAk9XGY/4i7fslQCf2hER9crlesdokiXkx8fpoEK1e66Fdl0cUOBVJD7OKveRSNoj
 OGxdRvx28HFlbiDnXTQ==
X-Proofpoint-ORIG-GUID: LSEcoj1iC29jjKijeZizS-upUdqeZAlg
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae43814 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vt5zk3HvMIXgJkxpxWcA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX+yMDa5DQl8Z8
 aJE1z8pqzIe6ApgtE9lQg3eDKTLpdUgaUA2c0VPA4wsm5fQE65+HC7jPWiw5ItLorXVL6Cw9vAc
 zyRjOLRbViiFXrXWDJKKDpXkzwc03W4=
X-Proofpoint-GUID: LSEcoj1iC29jjKijeZizS-upUdqeZAlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

On Fri, Sep 25, 2026 at 10:22=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> The PAS image initialization path retains metadata whenever a valid
> qcom_pas_context is supplied, although callers may not need the metadata
> after initialization. This leaves ownership implicit and causes unused
> metadata buffers to remain allocated.
>
> Add keep_mdt_buf to struct qcom_pas_context and have the generic PAS
> wrapper release metadata unless the caller requests retention. This appli=
es
> uniformly to SCM and OP-TEE backends, while qcom_q6v5_pas keeps metadata
> for subsequent PAS operations.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v8:
>  - Commit rephrased a bit.
>  - Make the commit aware of all present backends(scm and tee).
>  - Link to v7: https://lore.kernel.org/lkml/20260920074919.3338358-1-muke=
sh.ojha@oss.qualcomm.com/
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> Changes in v7:
> - Since qcom_scm_pas_context is removed, v6 needs to be rebased removing
>   the changes related to it.
> - Link to v6: https://lore.kernel.org/lkml/20260805133759.2790755-1-mukes=
h.ojha@oss.qualcomm.com/
>
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
>  drivers/firmware/qcom/qcom_pas.c       | 12 +++++++++---
>  drivers/firmware/qcom/qcom_scm.c       |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
>  include/linux/firmware/qcom/qcom_pas.h |  1 +
>  4 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qco=
m_pas.c
> index 24485dd0fa10..93d78a5c1201 100644
> --- a/drivers/firmware/qcom/qcom_pas.c
> +++ b/drivers/firmware/qcom/qcom_pas.c
> @@ -60,17 +60,23 @@ EXPORT_SYMBOL_GPL(devm_qcom_pas_context_alloc);
>   *
>   * Return: 0 on success.
>   *
> - * Upon successful return, the PAS metadata context (@ctx) will be used =
to
> - * track the metadata allocation, this needs to be released by invoking
> + * If @ctx requests metadata retention, the PAS metadata context will tr=
ack
> + * the allocation, which needs to be released by invoking
>   * qcom_pas_metadata_release() by the caller.
>   */
>  int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>                         struct qcom_pas_context *ctx)
>  {
> +       int ret;
> +
>         if (!ops_ptr)
>                 return -ENODEV;
>
> -       return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, =
ctx);
> +       ret =3D ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size,=
 ctx);
> +       if (!ret && ctx && !ctx->keep_mdt_buf)
> +               qcom_pas_metadata_release(ctx);
> +
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(qcom_pas_init_image);
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index df20773dd754..dc57c87870cf 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -666,7 +666,7 @@ static int qcom_scm_pas_init_image(struct device *dev=
, u32 pas_id,
>         ret =3D __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
>         if (ret < 0 || !ctx) {
>                 dma_free_coherent(dev, size, mdata_buf, mdata_phys);
> -       } else if (ctx) {
> +       } else {
>                 ctx->ptr =3D mdata_buf;
>                 ctx->phys =3D mdata_phys;
>                 ctx->size =3D size;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 879c465c4a7a..ae93f693358c 100644
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
