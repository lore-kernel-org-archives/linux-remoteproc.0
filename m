Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829142BEFEF
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Mar 2026 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738176; cv=pass; b=l6qQGcI9IaAHF9euj2UmGEJQFajn0afc1LyZuv2csPY1i6+iO/c5Hh6PER/AXWS37HXXBb8R0y9/jL7grIjHMugidQpdLw0SfVxb7vlA4q1CPHcWwEjzFXOXO2UoPSu/s3Ui/kIy9j+Daxb7NAG2kLRepjql9dXwUkdNifRQTxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738176; c=relaxed/simple;
	bh=T6mSzgIW84n78L1oui6Tey80VTrBXBQQ2EtxjS8uHis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FABNcvy2rdd0goBQeSds9Utoi5PdxXlJM/0Ku9l60ZrFntnI7X6juJxS+Jw1hrkxiijwpsHcqM3W/yvc41zC2tCxFfmXE+WuqZdntdjh/ZzTUQkhyD2WJVXG2FFRaw0TOQMrZXXrqeU9whXTPlDkkDEO5p4v9fO0UQsklCkcYTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJuY0VFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGvjaBuP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJuY0VFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGvjaBuP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625InCHZ456115
	for <linux-remoteproc@vger.kernel.org>; Thu, 5 Mar 2026 19:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T6mSzgIW84n78L1oui6Tey80VTrBXBQQ2EtxjS8uHis=; b=SJuY0VFUW+EYt7Di
	8sqA0lDv2LrEAMbxpn9Q2x64m6PUEoW9YgH/jXkxCbmvMnm8pD9ZLF1ryzYyvG2n
	gG+oUsXhxDePWXzGBvl4Efw6F1NotGsFqFaZUeI264z55fjF9ui187Wc2cZerpnD
	QYxrvioO9GptmIlorO9EvrTMUK1o/nfUnZ9iEKji8hJvoblzTzRKhGwWzrxmPZqP
	yri2uPt8QiFuqejiUaTufxn3u2kl64XEL36o5GBZqY9vWL+4lNF7sadkPtJ+4XMw
	jbTQCUQKdf9u1hxFsOv32LkiD8/ZfXRs8hVWGzPF2LiHdEkpfCKocmBzBsYbKz9w
	IR8i5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wmm8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 19:16:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5033b4d599eso638963581cf.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 11:16:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772738174; cv=none;
        d=google.com; s=arc-20240605;
        b=XvXyHo8+MMtmm+5nVBhX91rXeiJj8vxbEFWbRxfvLjIOBZ8G6WW5Z4Jh6Zj8inPgTP
         MFwUnArHNuHQXr94dvfcwLVpSA/ChHUXOpqKgCxLcUahcl3euG7RMZTnjQGKWh/6/0ds
         EpP6z9MSptypF83QV4FOEz48krCdwyGUTHw2ersYtPBkgJ8vfo4iuyR8OhOP15InbRSc
         5tcWRWUMsHPK4XvtzaCWm+pw2lRuOWXeIWWA0Z9leH0AkfCqrziA83xgtSOMqflEXH0d
         FPqDSKF4J8wVL7vROon7cn2v/QWFNAUwDGZzHKEdZDmd+VpkuY9WhpoqManRThDLzb6i
         nfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T6mSzgIW84n78L1oui6Tey80VTrBXBQQ2EtxjS8uHis=;
        fh=c6Aub3JfKHuRfqXkXU0WU/ZjJgJPYexHa/XE2VnpWEI=;
        b=QFZ4RuwQXe6HxBuwWRCHliPJ71OPuQhMHfXJrECcTDVg2lj7YMud7MddNE9IHUwG8G
         RP10eJjE6hbG77sqYZX6VwncQNjb+H4NwPiLMAg8UW1amTzn2xFYeqNi4O2aeuyLAd6x
         KEInePnqg+7riDhgjG8eu/MKqNuIbjTQ140FlQe+Efg4a6K81ZepXYiZLu2VxlKOhzZV
         fkyKO8bcuH9oMRy4RE9WVxsuDJW98Y5ROSfA+A7zn3ld2M7lehPY8x7PqrPZBqXuE+uf
         8SCP//Zv5yFFFDmEU7gD+j3S6Ugyu/5GHNBvcga+iagmof9eiFr5wag1DoqdjDqpyLMi
         TCPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772738174; x=1773342974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6mSzgIW84n78L1oui6Tey80VTrBXBQQ2EtxjS8uHis=;
        b=WGvjaBuPlZgy4w2ShPaT3kGymear6CqE7+nuTbltWd36jVgl2JhLEZUAbBID8AWbRX
         +NXDP2xN6NcAHHqiLGNsPOZ2LGFjmP/38FexB0XW87PgusqAir+vKfL/XCoMJ+9XjdUx
         2Ghbp7H/pGh+x2Vq0AISrCE6bmi4uiRhMLn2W3VWchQkKWMGFtt37x5tuIfRuGEB7uP3
         AuCqPoac3Anut9ny8wtmDispyGjySo3+oajeJmsnOI968Usvimd1He9jVlgvKc4G+oun
         i6WsBTjiON9/HsrsuesX3SZKMx4ow1QhcAy6aAeVNOiu3sUPOYguEYT3XtNR/wNI3fJ5
         Lokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738174; x=1773342974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T6mSzgIW84n78L1oui6Tey80VTrBXBQQ2EtxjS8uHis=;
        b=lVWeQpwdfxeqioD3gp7f3nuEWQTyoTX+p05+6IHc0T/RYotcsnffJm9Zu1Hd6ZT7Lu
         TJlGnGDoMhGRlrXSPCxsnyC88KbulSUYLjAQn4bMgHgN8Xn60ZlOWF5euSe0LN/HWLvF
         pjBYQh5qmScGIcgbD5zXcZ/8MmAURPL2K5s/H/Yt4ocew1b9uj4lmCGJqCMJ81qaEL2Z
         KtSCbzWQ927gLE0agHIBxAeo7BmclTn4Viqs92ty3+FnqJQePoMmVyZXkZubAxDeTdNI
         GJeUu0pZrrI1Z1q8dpHfLtLh2GP1rIP0iCU1zM41JDuJuVYqCVXJrSBirAKJUoSgVxfE
         WCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8ykGNSoUlGpVYbMyQjem8l3/RfLfI4ss3jIbvEwcANdxOpoTRgb8bfpJILRbHQpeExGZFTUBPG7IQbB1SHMyZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzOA545sCnRYWZFJ5H2lhSVYxYDSmOuPu+JbpUr5nw0aKxLYTVn
	e43Gs4+felTYbJ5YZwK3TcCZFcNBzPnqwNNhL2cKAH8KuirBojWc969LRdqz4r+EGnRULB+ycap
	D2vFGwmLC6r/q7f5lDhtIeQ4hslM/3QFQkUOQhtcSsPyfKAmx5kxCL3otLrGV4yvrv7bEVbAN+V
	nZVonqsG6xqGB06yOvXRcqmHdMoZBgZMBgQ7HuBUh3xXRx7JA=
X-Gm-Gg: ATEYQzyPqq8AQY4KjJkqXVNAAUH8A/FVwdhtRsAt/IFqwMCXTk64q+jbvPJXgKsGGV/
	k22Lj59YQvvnH0ufdoKqFiQ/dyFAmXQytlzm6GmTor0kjCxSzMdNgLT0sBkNtXSkbr7y7U5ZzMu
	5FL6AmrD1fHSYMpSL7EgG9Q8Wl0sclKrV0MVmKvC0sq+GCpy1+panT1v26YVdgWK0KB13nzzC/6
	+aGhtMzuKMJQ0rK/pq8NLqeirnBt7+q4l94MgSEJCwN8YP9B+gQ2v3w/qx+z8or7K50
X-Received: by 2002:a05:622a:1914:b0:4ed:6e70:1ac4 with SMTP id d75a77b69052e-508db35a31amr82530301cf.42.1772738173746;
        Thu, 05 Mar 2026 11:16:13 -0800 (PST)
X-Received: by 2002:a05:622a:1914:b0:4ed:6e70:1ac4 with SMTP id
 d75a77b69052e-508db35a31amr82530021cf.42.1772738173307; Thu, 05 Mar 2026
 11:16:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
 <20260305003253.1022386-4-kerigancreighton@gmail.com> <dea45e4e-aebc-46e4-a245-3603da1779f3@oss.qualcomm.com>
 <CAN6+ztxfcNR8xR1qwgHQcHHM=zoQbMd-8oggb785ssPZ7f=y4w@mail.gmail.com>
In-Reply-To: <CAN6+ztxfcNR8xR1qwgHQcHHM=zoQbMd-8oggb785ssPZ7f=y4w@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 20:16:02 +0100
X-Gm-Features: AaiRm522mri_3_E_tLhvFR2PzRjD2c5pLyo0FI7lB2vgbC2_G-1Iu1ExQrqtndw
Message-ID: <CAFEp6-3JVicAVJB_+5ceSar2Jqstexo-0tyemg3C=qcznQsmxA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] wifi: wcn36xx: add support for WCN3610
To: Kerigan Creighton <kerigancreighton@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, wcn36xx@lists.infradead.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: RFGznqneOH6RLCt5z8JKqFPhiFw9Kg-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2MCBTYWx0ZWRfXy6VStaCsnqy0
 pWjruVs/Ar2aMgAnkN8xYFbVJ7xqo9DzyKJJBnjnMMpjtn0KEWh2bysgAdBZ61mF7Udtibn2ttK
 bcSc5ZrZTe6NAqaObpsliD4XpnviX7K66kpjOV10gsngxXdx8S4tRwhkYhSAO9hjmoUsI4TsuCU
 ZKo5Cz6ZRke2mSygndRC8atQJ8wiFrqQQ8v6JGSKiXniOfyu04bOgIyzZIfhlPofgbGvhoC5NBy
 CtCW1hOChEs6lmmNqvvsIiJWSjN0Uqa2/XGiwUOyMwPIqyizPbvu5canNuX3RrnQsPuVKkJIdRn
 xPJqseP46KaMTqPcDH6o2mYNEYeTXFc14zwGkcSKsN+ULGzqOmahbqorAQcPXGi+HaE8y3K9mqt
 z7PnksH3zg6ghgqbWVHm99OJzU0gArdDPqK8uFBfD8l0zKO8S4L6Si80cxBnthCEGG0Z3fBrMQ4
 W8W3E9+2ij/h8PnFcPg==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a9d67e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=29fU08-qhLxzT5EMGmQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: RFGznqneOH6RLCt5z8JKqFPhiFw9Kg-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050160

On Thu, Mar 5, 2026 at 4:51=E2=80=AFPM Kerigan Creighton
<kerigancreighton@gmail.com> wrote:
>
> [resending to the correct people]
>
> Some of it is observed behavior, some of it came from seeing what
> the downstream prima driver does.
>
> With the default configuration the WCN3610 shows extremely high
> packet loss (~95%). Setting ENABLE_DYNAMIC_RA_START_RATE=3D0
> (as done in the downstream prima driver) improves this significantly to
> around 5% packet loss.
>
> Further experimentation showed that configuring
> BTC_EXECUTION_MODE=3D2 eliminates the remaining packet loss.
> With the firmware default (BTC_EXECUTION_MODE=3D0) the chip emits
> BTC-related SMD events that the wcn36xx driver does not currently handle.
>
> BTC_EXECUTION_MODE=3D2 forces PTA_ONLY coexistence which avoids
> those events and results in stable operation. The downside is that this m=
ay
> increase power consumption because PA remains active.

Could you please add these details to the commit message?

Regards,
Loic
