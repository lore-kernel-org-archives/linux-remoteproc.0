Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F06438001
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177600; cv=none; b=KC7NFec1Ym5ZrmUhkb90Tbhs+gIiRAR9FhEJErnq+pNBbh9rVbRyzM+cWCSCUAuexxKpI4P6sw90haF4GPxoU95/9ybsb0Tls1zDYw2OpSgr/7KM8XwNeRHtggal3/wYOx/Ql5j1gtrT1aqbkVFBOoQcqiUq8k9vDkrHvdBwVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177600; c=relaxed/simple;
	bh=37zguWih+b1UsT/1ZAs425jIctLpVxmJlwIfFLGvVNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE8oiVAsTRT456ugjBDvSInm454EOl39wn3LnsZpmpKkxXC8QXjMIb7ka5oVl9Qa5HmSZuEIBxgKuMu6OvJ2e/LxHpY+IIFbv3okhJdhRRU6GvipMEzjToGO4eao6REf+gJh6BpWDQmknK8Rian8ZyiCRlIvueZUNRyjakkuNvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLYug4lU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQ4qaW2/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLYug4lU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQ4qaW2/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RICAKO480291
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 18:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dc37tfIhue0wL8SZOw1sGO1g
	+jEfLA2LSgFTGKid14E=; b=mLYug4lUNYQavzoriX4+2X+aKdF1BXiq41jo+ptT
	x+HzCYj44ICsmvWRRcdfokZu/8JXxctTTbc+92Esum7WPtk55MCWoqRrFLpYg4OS
	Wx32g1seYldyPSrFdUkrOaLVZAxGwy6sVEgUY9wJd2dJhIaTR2oH8EPifk/jpjfi
	YmfoBJXVOOGO98nru9ZXzvEvkUBiyiTVfpLnyXh8IRyiiVyPrQD3o57GSvAnfxe3
	468iZcBkWVsV9lzWRKmWTdctiWfPowyESt+N63J4tIOfpeHwPwubh2dlPXbpr2Vt
	mS8dBQa8XAcq7GJVE/lz+xcrj1eAQ73AdGiiPXpfqVdypQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq2bme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 18:39:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccd1958e8fso41195625ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 11:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785177591; x=1785782391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dc37tfIhue0wL8SZOw1sGO1g+jEfLA2LSgFTGKid14E=;
        b=IQ4qaW2/USSd4za6E5CMXEmlY0HBOaWvYCZYmAijRnPbAkvtDKNNr+e6SzAalNKQrF
         DxYt5U0OdV2hhq1T+LbsGZyQefuZCCTFOamJuvC9ihTSFhUI9GXtRtXWED6naSj5HiP1
         RD1WLAta2Y7s2+tlmfFHLt1m5/e9wh28CHj5TAq0parmvqITiBU7sH9DZa+JxKtF1KMX
         JcHRHDOOUkebTR+iTcb6+/cnsJJcz5S0SP1axzIuh3JEtEOIHBajlkvtc/5XAVsIh+uF
         iQ70lo4guj4F8V/+6XhhFRQhT6NKFyXdaZRe4yaf0BmX/eNOgYVCvExwd3RVtNGXuK9+
         wAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785177591; x=1785782391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dc37tfIhue0wL8SZOw1sGO1g+jEfLA2LSgFTGKid14E=;
        b=q0NtvO0pD5bY2pP/NWek7trbkrvVKQW+sNc0SnZ9H/7njzLj4rRGJRkvkSucDyVTEz
         szfcRiNdWOWhf3SNz+ykIz+EXGfr6zq5qU0GWJzDBRQssXel03d02h4KcGaUGYkV4kO0
         vz+dkdtEKtyVELddYXSYzZsapaOrydTzVh4NG7ExE05q3qdgMYN9r6SAIwZeyijVr/V8
         0sWaTIAGvfS7zfrNTGf6YN3f+galvCUz7AvBET2Z/ilCZV32PQIe03mzc6RWjzGiwWhA
         0qFu7aiqP5QKMRV67HB5mlIcIDEskh0Wgh1mNxS4MWxNe/BG9UWoptkCnTVpN97c1HSi
         bLKg==
X-Forwarded-Encrypted: i=1; AHgh+RoYG0ktLXpy1aszIr4x4HysAzNISumjerLV65s74BLpvGwi1wsou7zThB2VxORs1IIY9RalQQRYSlVVUlRw/67a@vger.kernel.org
X-Gm-Message-State: AOJu0YxAcDJ8cFXiG0EpOTDkangkagI9TjDwD0gB1SgTHpEOSt1GK9s4
	uj0tnDpZ0D383SmQWelEgIacWgOQNbnbCxtlgG0MLIuRL3qnCvkxyrSx8Rd45kL8Z0c5fHEIKfZ
	MI4emnidFEM6i9xkqDeqnzuicabcRvLyKEfVVBq3x90twMnW+qcKm14JOHs5l7zzzvhPLKUXL
X-Gm-Gg: AR+sD13zuxqm01HZAnljaibN3kNTx9DwAK5Ha2bo0GZzDyiNK48XvzRVXRn6gO4JJgl
	JlXs+ad7YACOTES7iH/pgQRYu0EKagtf85p1KdJADCsBaD+t7nTqr9EjGFOTjB/Z6K7AwB9mruM
	UNd4eEL+PM+cto4R5X3cfYGUp+YSnsIC5aCfywfD57XAKZJ76ALILsvyrADSYWLrAYjHelzhZWf
	ROilEUVHY/yoXivaFtuxrSCqScS94Wiudb2uVVNdwZXZPCSyhioiJoHa8B+nwYhMBWWd0lOGjoc
	Ass4C8/1jCaJe8qYYNhLe36T7sVXSdQqvDqkQzIieUWhBVM+mSd4hJa/nTM10D5MRJuqeRoLNpF
	U96tkhAkmdAX0iCW+bKlqsZaDRXLu3UbaEcRH5Q==
X-Received: by 2002:a05:6a21:339a:b0:3c3:90de:60e9 with SMTP id adf61e73a8af0-3c67dfe0e07mr11436279637.62.1785177590900;
        Mon, 27 Jul 2026 11:39:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:339a:b0:3c3:90de:60e9 with SMTP id adf61e73a8af0-3c67dfe0e07mr11436239637.62.1785177590465;
        Mon, 27 Jul 2026 11:39:50 -0700 (PDT)
Received: from hu-pdahiwal-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm90229752c88.15.2026.07.27.11.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:39:50 -0700 (PDT)
Date: Tue, 28 Jul 2026 00:09:44 +0530
From: Pradnya Dahiwale <pradnya.dahiwale@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: Prevent crash handling to race with
 rproc_del()
Message-ID: <amel8GzMOTlIM8jL@hu-pdahiwal-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3MiBTYWx0ZWRfX5h9lnlAbRLqk
 HG0aa0LrMGSeM8Tm/tW4g55Demp5t8rh6PZzPxqYuTGMWomx1WhjJHIr88f+Ju3jABKBXuGfzN+
 3/D7bya/yqPmvQsGsYk7RvtkPVC9QcQ=
X-Proofpoint-ORIG-GUID: S5n54K3t3JReFzS-10T68bnUx6Ebsec3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3MiBTYWx0ZWRfX7r2zheEWEcGt
 a5jTNxp66vBo2RviX6LfAzhKWmwXDPZ/vZe5rLn2ipGDupyrVwc6aJJrwyIEb1XSo/7qg4sVe+Q
 P7iHZUb1lYF378d7Z9RMltWyxwQZ5aAYFugjoPlDX7lSUlFhVZHsGYmtWQHZKgdw5H5WxbBbiCZ
 bz1OAoGnHVp5PqOKrUKLk8CMTYnB2+T87TbzW6QnMEnlq3WZoXAimHQTFsQ4Gux6WPXwIAO7E+d
 FW5CLx3DE58T85SaVysURu9oEN+CeOhzFmYhAk/4aOVPESZSZnmylirsgP1XTwwXSjz5i/QQkTi
 LSRjrH2SmamQeJLoTkuCanemCDtGPjS3Bv9dea6e3h4ro5cJQ2OCc5TVv0v8QkSw+IQRT3lTvfw
 YOqyj2FQKOFcNwVCmxGYIY21Pg/RyA+qnrOpsd/Fs0Ae87daGv5g0VUIOktdHVI7WCPeOtkcLj3
 5C4af9Pe+Rd5wcTElXA==
X-Proofpoint-GUID: S5n54K3t3JReFzS-10T68bnUx6Ebsec3
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a67a5f7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EbPn-TOec6_ywVBdj94A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270172

On Thu, Jul 23, 2026 at 03:52:28AM +0000, Bjorn Andersson wrote:
> @@ -2598,16 +2609,21 @@ EXPORT_SYMBOL(rproc_put);
>   */
>  int rproc_del(struct rproc *rproc)
>  {
> +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> +	WRITE_ONCE(rproc->deleting, true);
> +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> +
> +	if (cancel_work_sync(&rproc->crash_handler))
> +		pm_relax(rproc->dev.parent);
> +
>  	/* TODO: make sure this works with rproc->power > 1 */
>  	rproc_shutdown(rproc);

rproc_del() cancels the crash-handler work here - should there also be a
matching cancel_work_sync(&rproc->attach_work)? If attach_work were still
pending when rproc_del() finishes and rproc_free() drops the last reference,
could it later run rproc_boot() on a freed rproc?

rproc_del()                        attach_work (still queued)
     |
WRITE_ONCE(deleting, true)
     |
cancel_work_sync(crash_handler)
     |
rproc_shutdown()
     |
device_del()
     |
rproc_del() returns
     |
(driver's remove path then calls)
     |
rproc_free()
                                   attach_work runs
                                   container_of(work, rproc, attach_work)
                                   rproc_boot(rproc)  <- freed rproc?

The deleting check inside rproc_boot() dereferences rproc itself, so it can't
guard a freed one. The request_firmware_nowait() / rproc_auto_boot_callback()
path looks similar.

Reviewed-by: Pradnya Dahiwale <pradnya.dahiwale@oss.qualcomm.com>
