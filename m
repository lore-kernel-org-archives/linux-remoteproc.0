Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B237700B
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 May 2026 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886562; cv=none; b=pfRRxLwEKib47rvKKSHkEFCu4ZgtTDDOHZ38ou0hDrl15n8pXjxs3WI2kw0UCkmR9YR3bNmD9q90trHL8D6su8AYVD1CarSrTnDCE2+jNWoX98ZanR/Xvqe6iEMqfqpABbl8f0GfvL+dy6wWpLvOlsmCoTpyHhqF/DEKtO3guTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886562; c=relaxed/simple;
	bh=0MgFvCSDTuHg4QDgFxl4BQsxVp8Ywh+kfF5DDfLCKJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jq1JoelgnZkEI/9nwk/rXg1GF7xrpC4jonoW2wzRY4I8JDhsLkJGVvo+Ey6sKO6Mn8SmFYD/jHkYdYAQwnbhQ1rCSJrpllb082Usmn4PZnL0i3uVlXEFKqQOQZQI3lwCtFk0/wm/XugQZofVZoJK5z6gcHrCjHWcNFDlUJB8M5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jT8UcqmQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDcGtUpn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jT8UcqmQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDcGtUpn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fcfG2777487
	for <linux-remoteproc@vger.kernel.org>; Mon, 4 May 2026 09:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+gQ2IYd21NQFildd15TvBHWeYnVzvUERn8F2hMpH7o=; b=jT8UcqmQQ7n8kYzv
	d916VXBnBVQAm78wuEtAHyF33nuIfU7O9muUTVQLHdQqRCsxCnXUQgbmZ0fXA0qg
	VmH+gx1lXTg64WQaDkXccTDHvTbf9NCeimH7F3QvzoHpBClvIZjBqcRFZDiaKgiv
	5qcakwNqNRUSy/wv2UxnUomasVoiBjozKqMsvBe0/7eJysYubnJaFJGtT+FNI9ux
	OgE/dxTSRubj28Ew83LknbElbkH3kqwyMivwUvQUpW/TCMdouKIirLws0rS6Mw3M
	Qt8JuiFnIajoHlvcRdHSE5t+L63sURsDNn0q2ML7g9KvopCF3sLVwS/98cB8bEpv
	u27RAA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaj7d1s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2026 09:22:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82d40278103so2311502b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2026 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777886560; x=1778491360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+gQ2IYd21NQFildd15TvBHWeYnVzvUERn8F2hMpH7o=;
        b=cDcGtUpnY6BZf4S7MEsYNlhw/H4RIOuySsW+tNqhyGUx1new1R7U6UQwAXYS2eBjXA
         zkv1xaEC5r211JGvtyaVyBZe9l2I+g0jM/DFFSbTGwSq0o706E4jLjMb01B7vHkNnlKq
         6PwRjtIjgEZXd5AufLVKkzR+V60OyTFMobWXcXxGH/n64a71rwOiYC5FmisKwh+rrVpB
         mFxu5CF+ETOOHkfi7HN4ojFhgTj6mzbMRR/rIVNzKUESFXq2SUq4QQxcla6BkqHK3Bc5
         fN2Yr2PLIKH+g8ahTdn91CFXhrfrBssZAVA68+o6KTTjYrsdCt/C3e2lWSkWkxBdWqsE
         zhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886560; x=1778491360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+gQ2IYd21NQFildd15TvBHWeYnVzvUERn8F2hMpH7o=;
        b=eR8jhtm+m+IWRHaIs0ziC8PkqoM6NXil8Z9L1U9S5sPJKnmGOt1knRGjCZeyDvTpo8
         gQraEkga246RbqQY/BtkQ4by7J6BpJNzcqh5TAsfs+Mfgh0PPlKNWhQPDxNEAP3aoSmT
         KMaaZZUemS9lKCjn/mGXbOxUOsqWavMesAvvW8dSGvYa7I2DbmbPkuYkDRjigku2yvtP
         Zz/b91jsaMeFO8a8CC23QDXUAno29+9aumIwD5EivzE7UU1bpy68oOfF4jyjWesEs0xu
         uHxSEj45jqtGYJpvofEv7kyCtVWNCN3bV2wVEKg4QZZkFWY2MYzmeyuITdmEcTFq+Uoa
         wn+A==
X-Forwarded-Encrypted: i=1; AFNElJ8vFvBT4u25v/hGg28UeEc2TDYsir/Eo888k+Es8yTFROTd9uY+P5aRgdFKq8EtK83tytJdzFH6XIimftD5XzEm@vger.kernel.org
X-Gm-Message-State: AOJu0YyfHtjef/soxTV5uIWLUiyeYmFQuwM3dxzUeYscV/V4CXobI1Qy
	FxN5cC1czLAjQf4P0hLzE38ZmdvyKY8tPKJVOuZIwfJb0lK4HkSwZUu764PYujCaCMpiIpFNO92
	aR0+lZFTgrnCLIzwSD+sP4rdB/MfTg0WPbm2kwRVFkL5VczhzKmRfHFPMm8XnIUvokl6EKOoI
X-Gm-Gg: AeBDietsEdlYy02VRN5lV2jThgWHMmCrjEBuRSIyQUrzGHZEPjj7xqTRQ/ob9vCCyDm
	+hFb5ieHkjaX03MbsPRBXkSROY+FVuBFEC399RGo5+DCkbyesX2vMZlH2kDRk87VttZQT8JeaU5
	SkgalhxRxm9ur+bv+vWDJ/Iy+xeEPUL/M/g8Onzir7LRQGFL3nBYVhd7Xk357Z26Wq7D9FFhOXG
	2NULQ2/pNBNbmFIvLxCNGISXbO6uudGSosJpwStFlWX5ZFe2p8dAPTiMr6loP0smK11yrq0vYc/
	6uYiD5Nrvb1/bvhKG8+7S0QNLwpn9JX7KTzaA+I9ILa9Kw8ntC4+e2B3gTtHv+W30MJL8bzHubi
	vJC7ehCgTAZdMZAbGcbbLR5wPNkfl9zwLtnj4W/Zqt8rbljkyQZ4GXt4n9dRpVw==
X-Received: by 2002:a05:6a00:3c8b:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-8352d1fef20mr8936727b3a.25.1777886559736;
        Mon, 04 May 2026 02:22:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c8b:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-8352d1fef20mr8936668b3a.25.1777886559217;
        Mon, 04 May 2026 02:22:39 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83775b1eadesm3030462b3a.56.2026.05.04.02.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:22:38 -0700 (PDT)
Message-ID: <ba8c170a-eae7-418a-aacf-92b394c401b0@oss.qualcomm.com>
Date: Mon, 4 May 2026 14:52:24 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] firmware: qcom_scm: Migrate to generic PAS
 service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-4-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427095603.1157963-4-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rhq8fIfJdETmDe1MLjWd10sjGYDtH6ip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5OSBTYWx0ZWRfX5iNm/uFTlkEF
 n2CinG7dQhPUNIOPLLK/OEmUMqQWl+oa01mZyl5uPRQftwqFsuEw2RBFV0GeF/QmdOpiiKYD99P
 P6XjVXFdfm/J/jFZoh6n7VlGFQqav45Tv0BhvaDZOMCxwdpqZgxT83N25FHs/3HAPMFnIyfDmxR
 aefwjDFkBS2GM4VpSoGLGeqomXaim3vexWoBSrnAQguba97zp1VZq33bknUZbaS63iO8GjDcwfw
 xcw8QM08XTE31ZHBNhnNlP/Y9rxYoNSdf82VFgSvaf1Xopx9pSbxrzzTyzKUGPa5PV5V2B0LJoh
 SF915oVB6Qo5Qsf8U18JThXJNzZUgMQ0e1NMzn3ckH+dDap0q0r6x9GZgE9NTAqdtPnrGnV7bte
 CqSddyw9DcyMnbgGIRmwvAvmXCkYEZm1C/NT/i5/TzTawTqR8TdK/azqfxof6E+yUulCUydDiUR
 EwRGvRPESzU4vP65IDQ==
X-Authority-Analysis: v=2.4 cv=csirVV4i c=1 sm=1 tr=0 ts=69f86560 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=58GAH2X6W2vqmnVK_tYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Rhq8fIfJdETmDe1MLjWd10sjGYDtH6ip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040099



On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

