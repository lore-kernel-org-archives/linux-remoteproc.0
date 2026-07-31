Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A751032ED55
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479695; cv=none; b=eHuWAGKaK7gu5qDXUX0Z5WPtm8la1HQBCWVvAQBQPkl7dDfR7lmQbdc6try+552gvNjwRoIIGauIsNq7RRHtYFZ3E/OfLLPq31bsMnT1JSfsPWPE8aoMYal7oBg9lcNR2pwUBjzsHH21si0Rgqej3uvqFagwlYvCDfQue2D3J2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479695; c=relaxed/simple;
	bh=8++ZzDXrEvZL0zeYT4jE+qMoVt5Kbu3uggqmyiJfUtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nw8Hiidty5u19IOEdap4QPpE5qyLfpi/y+uaW9yFdHlP04aZRCo/Msav3cWFdbBD+86gFDsRVZ9qNoYTAzoeeE7WB3faOA5wl5LoDmFdkDDEz4sCVaLv81yutAI5YLXmwUvW0Z3UrzEsjwurHlOy8gJa9EEnpXKxCKIMaRxPGYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQBHOGVS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGs/THVE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQBHOGVS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGs/THVE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V6UiXp3470505
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 06:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rGPZLGRE+GG0G0o9lRtf53V7
	H+js5Tiwk4pq6Gwiamo=; b=LQBHOGVS+ZMkcMpM4IWqG5nOGX1KYyiQNGyg7nwP
	7R+N2lFqdDjHShB9e5Wm6iddZ5TB5ukdM5HMD4KhD9/vhwnVoiaOJD4PCItg8BmH
	qo0tKayhNoQZ6zNtXS6+6EXYdgooSX90CUXATZDzhmCKCmmtwawSXPQf1euc6hey
	YDktP4/a6UZvfYUm3auVUZgOOoKELnV//kVergkp63hU9KnyOQNzMReh11LKgf4j
	BDzOM3z43B3kCme6ITYURvR0zFPEK6FAgF0wlN/62l3Qefa0zf/AqYaqWH8Y7Cgo
	ooQthFEkTtgvO3xC2dRSCfchIfsQ5+f+kNbSQ9/7W4S2KA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frpgk00hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 06:34:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cceabd70f5so18490605ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 23:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785479692; x=1786084492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rGPZLGRE+GG0G0o9lRtf53V7H+js5Tiwk4pq6Gwiamo=;
        b=SGs/THVEt7LJQrzZEfrsbWnQ9LB4v/EdgqG+8Jy1/VkIUarLZyFt/SHaTn6WEUe08V
         t1qse+KPTm1Emsc59fCYSFqlA7BXPSgJ/iCnnpXoIxYGE55y1nbtQu3TkDsbnDTNh96n
         WJQBX4IXqPzmvN/3B+jlkUN033jYMrDtSbo04l5LxOXWMjCGv7jBtto8qd8ALqcmH3BP
         GRiYfnfpAa05qbZKmSVlGQ6khgVeXTbu9PJLI9k4kq47k+EdJEGuKAeWIvIUeWwQypqo
         bdudSv91zmukSN7OBmDBi7iNsbJltkJXbXL1HdgedOSTH+izVNmJpJip1wENtkyfV4cW
         thGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785479692; x=1786084492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGPZLGRE+GG0G0o9lRtf53V7H+js5Tiwk4pq6Gwiamo=;
        b=C1pU/8e4k4A+TpgvnVuPsPBUwprJd8VKDVsGaDeczTgfMV2u88AgyafUaSLltlV6bs
         28ZPJQqjTHZpxhPh1DS45zNAWDgLGIwFM/12bpXlwODWquArSDqKu2XL/4LK+T3tjSGJ
         WVns/ZcFNGkBBHrK9rAeO0M77PFpwxLS4z4ktUVueEDXO2j3aF10nN6gldZOTf6T4Yxv
         LhAkochL0UU6sgsCx3DVHZSwzfSfxmKQMBNNv2LyArhyG54v6EJATQDg+Pfn0bQO1qtD
         CB6WTPmXLU3dN9WSc1mQnkZ55K5Lt32V2Nz9j2ySeqHjy0M8M5Rv/TsZHTIJUE0Cdjg8
         gUtg==
X-Forwarded-Encrypted: i=1; AHgh+RrNbQqIV2fu9iapSlbzCSxPS3kn38aTLH00Ly/7nwMmLQEUzwBBwjOkHAlF1qK3u+DY3TgnC+9O/UhBs4BsdIjW@vger.kernel.org
X-Gm-Message-State: AOJu0YwWP3sdvulHz5++ocbj0n9r22aA9nG8BYlM+gfw4kRQ7yhHcYnM
	npislghd1WSh4p27NLQKftpwbYP/37YA1MaGqVxoUpNsTz/rVSwXdKIwLl79sydmXVazwkcCLm0
	+2B2rgkl91i+T7EV2lXqB0oX9HKkBOwly6Jd2qXQXx5v/hG8JSsabmB6EZlvNg56aWcZCj0r/
X-Gm-Gg: AR+sD13/ejumIiXH84wdpsYgirHLVmHTLYEhpbs1mQeUKpuU7cbWmrZE3DbRrT591qP
	x+J426pCriKmI7SHDoTZIHa9H7Rol3DxQ55iOuxrB+Zq9cc+py+6OScMLnEl9Eel2cqeyjb19E3
	gGDUK4Cewpn6MofSr/yDpLIRrPlfPi1NBLoe6C7EqFcV/Q8X40Onm6FDIEo5kyt/pBkxyBzgJc9
	NcRCiO9gXrOAsUhJSe2IfRG97Zc+HeQXoHxKGNfDd5T/qkkf8FogWLtrsP4kDcLw32d9bDhOhiB
	sU9iF9P6QwL+ZYcIogeK7eLwOLFqgH9Plr0E/R0hpQ54zJAUsXwjAtewCd725b/Q2/23r4lV5fy
	VzW2AW2aiig/ejvA7i/qrDW7SMRal8v7Kljxq6w8P2EQ=
X-Received: by 2002:a17:902:f745:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2d046eb4f76mr9160575ad.22.1785479692368;
        Thu, 30 Jul 2026 23:34:52 -0700 (PDT)
X-Received: by 2002:a17:902:f745:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2d046eb4f76mr9160355ad.22.1785479691898;
        Thu, 30 Jul 2026 23:34:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15c176sm1014045ad.77.2026.07.30.23.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:34:51 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:34:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Make handover IRQ one-shot
Message-ID: <amxCBj1HKOesLjYL@QCOM-aGQu4IUr3Y>
References: <20260612-rproc-q6v5-handover-irq-one-shot-v1-1-bb688f4446b3@oss.qualcomm.com>
 <amv781piw4R6txhF@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amv781piw4R6txhF@QCOM-aGQu4IUr3Y>
X-Proofpoint-ORIG-GUID: sS3vA8U1S2fWTEWTo6EMuBNGlDhgucrF
X-Authority-Analysis: v=2.4 cv=P4sKQCAu c=1 sm=1 tr=0 ts=6a6c420d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KUG0JRqKq6FkVWBsHkQA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MyBTYWx0ZWRfX3pLqoP4vlQUY
 CH7iSZpGJOo0++AnkFbpQ56S3kOPIENJzSlQr9MxJVYAgK9dUT3Y+M7HP9VEmdvH/IlLjxEGgbs
 z1rp5oDKLgeSLufnXJ5gTuanbXH3n5s=
X-Proofpoint-GUID: sS3vA8U1S2fWTEWTo6EMuBNGlDhgucrF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MyBTYWx0ZWRfXxT92+8Gizh+w
 j76Hs7+c84EcMFcF8OwnCYRfuZpDUvgupjOO+EEyYNwKd53AQN+9lTZYCzBXaY9/iZBuzmIdDIH
 Kw1Ma+5I5Mp9MtxTbeY/ZHwg3GGcWHY4uzZ0V1ElOYsYT9TV9TRCXqDmQ98cqxO6NqWkEXtQ/EQ
 cUiOcZZMr9QJbvUu3eeuFQ2zJWOzn007gfeKmxUdzrD5z29kaxhXQ63wkfKcE1l2z06xDJKGnBe
 7w6lnko2TV8Z9CD0ft8cDT9pJ/hiOZ/FaWZ2BMDO8RGq1FU7RdD+PcvhM3z7QYECR2O1ZtyjocM
 0M8B6i9ayAK0kL2uWuWXOEsLhN7ADL9HdCAK1FHJ0x3yfn/sfnNA2qLyxAactCsZ45kqERmm5nR
 I75kC0Ghhf98CzXns3cjcgWDvgo5xP1GYBbYoYYsqXoFeVLB+P6K7kVsUgG3qkyZ/EBoIUuO3mc
 +xGKnprLYZ0HV0Zey4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310043

On Fri, Jul 31, 2026 at 09:35:47AM +0800, Shawn Guo wrote:
> On Fri, Jun 12, 2026 at 02:09:08PM +0300, Abel Vesa wrote:
> > The handover interrupt is expected to be consumed once during each prepare
> > cycle. If the remote processor keeps signalling handover after the first
> > event, qcom_q6v5 currently logs the duplicate interrupt repeatedly while
> > leaving the IRQ enabled.
> > 
> > Track the handover IRQ enable state explicitly and route all handover IRQ
> > enable/disable operations through idempotent helpers. Request the handover
> > IRQ with IRQF_NO_AUTOEN so it is only enabled through the helper during
> > prepare. The handover handler disables it after marking handover as issued,
> > while unprepare disables and synchronizes it before checking whether
> > handover was issued.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5.c | 54 ++++++++++++++++++++++++++++++++++--------
> >  drivers/remoteproc/qcom_q6v5.h |  4 ++++
> >  2 files changed, 48 insertions(+), 10 deletions(-)
> 
> I seem to see a "regression" on Nord ADSP (probed as attached) with this change.

I proposed the fixes here:

https://lore.kernel.org/all/20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com/

Shawn
