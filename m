Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4623C288C08
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314470; cv=none; b=K0XWwEkAhzban5SYpj+QagGGYRcBy2dVNtTVlDjzRRHVAyoSAUVtkMnsdNgIR84Cq6hccSPbHK9yTuvForFdke23UOX37slZC+l+41y5oP7v5gWvrIOf9hpCyDobQeFGSrxAmOAg8HnzsVICjQCzi+ybXaAcGdsaJ0dua1Q9Qw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314470; c=relaxed/simple;
	bh=NeoR0fPNxCSdzYMkdOI+2qYm+0DV4Tdgor4+2UlbwKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+6XPfDLtA2ICuFNeheVGJ33MJ42My6vSYA3B/dDvNuYZyLDoXuMZAWjjgGbeU+z/W7Km75uduwKqd07BaL6x2AJGGGd7GBu/ljVNHNuMi+M+5nJJ0uoxZEB/HYKoUwMLVC0EzogYaf3pTfNaY7yoqhpo3NOiKwAtYu2t2KyCb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCaR4Ulo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMHu6MW6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCaR4Ulo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMHu6MW6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCX5A03810382
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 14:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4nT7i7wEpjHjKT3NdQ4OcmrJHkGn/s/l8olKaCe/HE=; b=VCaR4UloHp60WWR+
	ehYYYx1BW1Bzv2cY+oxJUBYhYX+6sN8bJ38ubUfB0K0jw0e3/Gy06T/+WYamOrTr
	zmE84kHRFVzK/Bjy0GF5uCAtyPA1mHxZlXRTqXaasp5ZdV/jbFkMP3HVqtErmzvU
	PgqCbmgPVafdjWb5e3YVrkBxu6Qgj2Pa6gODu0sd+CUKX9pvVkF/bWA79blvNMnT
	v/bwCNe5H/Q+hIQh+8DD9/7038l/erTBcVFlxuYl9FXoQnPy7vyczX1t9SIQF3bq
	vqAL3oiQNthAPGPrYB0D1LFbKYDNm5q/URBkIDvwJGFCPrknnSNkLd4WgjzmanVc
	UziIrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55smee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 14:27:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bbb6031cfdso248764685a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768314467; x=1768919267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4nT7i7wEpjHjKT3NdQ4OcmrJHkGn/s/l8olKaCe/HE=;
        b=PMHu6MW6ym5fOPxVgYyuTGRsfij295tnBs/nq+vy+0tNagzRtEXgzecgF7rW2IwTmi
         SZP4iiqVNiSiWK0rP0gZt0C0KIdXtWr0+tO/YENgpot4Ag2bSRT09xkOfh838rOCfQtd
         Vteers7FfT7pMXRxYLlYRY+R+lbfro2qIsGmS4K2aUG+rdBjbV+aPbvm42iF7pg7AKbZ
         0u/f4HnhfRqG/7Gnm+ZkXNVUtjU24X8rKJ0igpEK1VpZgPt8I5SS3I2OiRC9JApqa/H7
         q4oRBKRsRJqqsAqR26RLvFQqdSNqxDB5CZdcs8ex+bu+3BttBxpbZSQ0HZUrUl74DK77
         dObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314467; x=1768919267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4nT7i7wEpjHjKT3NdQ4OcmrJHkGn/s/l8olKaCe/HE=;
        b=Nj4gKtm4JNUWg75AUX01JmTrHK0Qz42E1bGSx+ySQoIzQ+oBEykTH6R7yFy+SnAsI+
         uevD8MhRoZgcfsWxGv1k8IxMMQcZg8jFewIhUmQHDWPrupIHBizWbY44TzhhJRcRIfws
         jmJ4lgZyA3A7HM/4mjG/G5ZuQe4++AOR5UnvhuF6m73soHdSmswC/wYdLRu+27SU336q
         GY8ISMAC7xdNmIJEr1dUuU9+JMtR+szpeobokqPt/YiPOzDm69lbgyo3kBFl56dQKstg
         MJHF8YSfUGUrHD1ThDwvzCIl5D6nGXu+1mv1ZTckkcAR5CvfN+hyhgyC6tDyyQHk1zcg
         0xfA==
X-Forwarded-Encrypted: i=1; AJvYcCVCcpcn2C+6C7H369iG+qVKMTEkkytFVEIfW/6Q+ggOFKSgnl8dVkBG9mditvUfsh0JxFt4czb+zUhy3MOM0bYs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7G9CCki32daeAPerPKXzBKMmqLvYLUQ+3iiuL8dVFRc9Gnvkc
	Fs0fXO/eV9wDJxuFT/rMmQ0FZgqHNJ6Hu3ibnUP7aF8sevswOsuvkcfS02LWmovwS87s5i+9tM/
	GXS06Hjn3tRTJYWiprTWowf4R9EsNU8GS9a/Lx0PFIIRN5zGL09WCOO5L86HkTSTms+M1w/WU
X-Gm-Gg: AY/fxX4BSCwoz0FJRQ4vaVOp0Am6Kse0sziVEYztSwUSn9Un/Rm2JaI2DqMkbOyt8Mb
	PLL1BCxtePR0yu5VWA0FxU1GVxW5Ulg0MZ+tWWkPMDKFgR04RSSyVBriSptOTlZHloQClK+abHK
	1PvSODUDY2o5YtA8pvoAfjUuxdS5O+zmIFtHhPu1yQ+Hbm9yb9sy6kaGphQaFr9oZGo1Hur1FmY
	hn2BOZGERF+J1pourvM18zvMDW+tig2FdmSQLKW1eZB2SmA90dNYLAGcsppexze3x7UcxnkpC8T
	w/4tzkKx2rMShAd5RnnA4269mR+546g4PzlAABlfWTHjeqVlojtQgFGkYuHRPEzEzBpC4czxK67
	XPO16dyEWq7D8UhNNMr+nDC4J7EdzRVtCdzELlblTXGmgHe7uPaSx5YRINA1mREj7V64=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr2194981585a.10.1768314466628;
        Tue, 13 Jan 2026 06:27:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHScso/L7ys71AOzWfrACJ67yGq+O1Tl0268Rco6zWp40zeSyEB9hK9SwA0CE9pEPkDciaQFw==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr2194977685a.10.1768314466088;
        Tue, 13 Jan 2026 06:27:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f9a9103bsm927560666b.30.2026.01.13.06.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:27:44 -0800 (PST)
Message-ID: <f9bdf491-0809-48fb-ad81-18a77d98ae00@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:27:41 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks
 from q6v5 struct
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        krzk+dt@kernel.org, mturquette@baylibre.com,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Govind Singh <govinds@codeaurora.org>
Cc: robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <20260109043352.3072933-2-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109043352.3072933-2-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ntGaE6cizzdCPEEqy3qpa0T05_-SA13f
X-Proofpoint-ORIG-GUID: ntGaE6cizzdCPEEqy3qpa0T05_-SA13f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyMSBTYWx0ZWRfX9Gw8uZob7loq
 c/xtpA5obeKA0KJYSh3fJm+5ECfqlx3fA+fqhM7vB2dJIq42nWj1kZP05A4O2rnD8xASHznh3US
 6dDPnDY1oGzRNmAb0TyI6J6Y2lRQkfKZX/sv7QaAZwnQ80V4Lq3nYBTRsbKM4lhxDtBjP2ixYvs
 GOJIpIMHwlIYnmXRbcizpF05H5Am/7Qk0Fzk4h4qSPrc2JNZGOR5UPsqaLrt4vPg5kTxx3wevgb
 1rUaYHRibXyglVPzYkr6+9YC+ca/mcr3gx1RrKV8TvSmlI+SafjzdCuWJFGWtZrrY8+ut02wi2P
 WagGYg9CiXMa7TOu5iQ/ZtnQa+/zMINfuEEVcQxXkRigtYYcV1OXFl4WXF1QVvNoLJEswEv8LDf
 lES4y4Y3+1EHsQVp+K0NPLKXtOZiHni1RWxGEAZmd5lwhY2b4JuWMCtY+Y+9l4/+8j22AbXR9mB
 xFg+yDteYlfMaoO3zug==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=69665663 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3QIJbu31o7VC6p0Pe9UA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130121

On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> Three of the clocks from struct q6v5_wcss are not populated, and are
> not used. Remove them.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

