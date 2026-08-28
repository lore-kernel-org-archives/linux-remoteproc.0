Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740F844AB98
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924488; cv=none; b=PhKMK8o3x7zdADUa9uuJfVjJ9dHkuHjKM5AqaJvfRIBOu2oorYGFJjKS0EVBUIeaGl+Zg1int9KKybtFcNO8WnRM1rGp5T05eZs7hoXVXlqWz6Qxd29jaFRxF+j4U98iygq8+oiUyYChCHjFfuFerMPq8zkem7w0GGP7QGbyNsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924488; c=relaxed/simple;
	bh=bDNekvoQ6EsvTgWcqctiw/kY1f4VrZJduk9j65q7Peg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBR1+/2HIz0Zcca/JPn6Ho2Wmsrzz6My0p/YaqdmcZPyGx6BdS7yXz7otUWmLo4mi2hQQVWIsniBAZCmg6dnZBbAlYe1CsfACqiQ9uZPKNWMo5cB6p8H/Lfmoq+RfDTl99kdmHevGAvuzOETdIkWVRQ8UilLBfjPFBVYmrqyAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzbakfeu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lni2AoCm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzbakfeu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lni2AoCm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDS0EM3162880
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 13:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mq09nfYXa4hsmaBELAkkYMzQ/RytSt+u7hqsPGWH3WY=; b=mzbakfeu96WnXKyv
	YmK8A8WrAZ/0VYMsMxp5N91II4PY7XuHwGfHv042Gj7y/76N/BlMet0kzW8E2frj
	/1sycB+8TB8r+JOPK7PhZmMjVhIEinbouStOD4LG3Z2GKzGRaVUSLsNAa7BbSEQx
	h/PxNhLPDM5ln9jftCP8PqoOXzr1AgAfOehcQfURcKrWdVlgMu+QWP8QWsJe9cKn
	QwslOPeg8EvkxgOMXg7DYQf3FhSZKL85vJcczRE+HNHIfk/Mgu/JSe7udhgLzLbY
	7wwxOAbiwOZc1l6+C7AnkwGGXq49CQqhUcJ5tXoay9ztjeiXhgFd7+StLD8U+3ZE
	BX5o2Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh0x3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 13:41:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso17176e0c.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924486; x=1788529286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mq09nfYXa4hsmaBELAkkYMzQ/RytSt+u7hqsPGWH3WY=;
        b=Lni2AoCmkrPCs/UTfqDk96mxjC0DLD16yghqsuVHE4b/KTOvh1Ejjrp19HXJW3hkt1
         W5QeLGJYw9Ot10lBZrjpp1w4AMDAGhGNcKFao0nEZgBKlRZsv3osG848rczLIntB/1W0
         r6ycbpN3ymiumNbZxdmHO51WVDUQiKlS2/4vHliEyj9g4ZIl8Q+oSCizmrCSKC5JB0iH
         rOafhL2p7p+hQh5J1oFYmHU63++HLhdszeZCdar9BD9T9Bw3p3oXhw61ExeZKpEUnAgZ
         9zmUTKcr7puBp3M/GbA3aSgTPTm7cAyQPe0GN9JEdU7pz0Nujgdv29B9p99LHLJqeo6f
         d6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924486; x=1788529286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq09nfYXa4hsmaBELAkkYMzQ/RytSt+u7hqsPGWH3WY=;
        b=GAq3ocjcPqwa7mzTanEG5+UFDboIt/ekjc9RfHg5UNtEHl/mrnZ1rR8yaj9B8hekGT
         4bhXx7qdTHsjOksoV3nhxd6BpfJKXQCjmVfccaOcHqVptNJZe5MaE2dUkgFQKSpOxkDL
         1bTgkjPNuPoA4XEeYxgUmeiaW/nSUOaEbrBlZ/m82rjTUjeFFkSklcfspsk01yMud8xk
         iX59TjaS46CWXS9oRv4cp99gpzYVZp7aPafqRyb64VsFXkJn5arzFmJ+EmDr/NRM2OSk
         k5lH86lMUU4Fm3VwGxt5x/YTE5e0xA/sSKS1rPmkZSoW0KPk3zLV2K1SKjRkY9k4JIl9
         AzSg==
X-Forwarded-Encrypted: i=1; AHgh+Rp82lSsQiHVvAVGFk3XMb4AIwuH1nngZdOkAht4PXwR8uJHAeXDTkCsPM7v19lGwW/2tVPoE0nUQHDvI52DrZWL@vger.kernel.org
X-Gm-Message-State: AFuF++miUiwBOdafejjT7LyUDQDfPD/ZKhyD9XIOkbnczfXYF1tsQwav
	3RJddSuplPlTsKT2SZCulXWRshL4hRZpY6n30MBl4QbuE7qJURdV3MdV7DJMm2I0x0H8bugPFId
	gV3qeaaKmcJVu9eat00POAz1Ire2bCcFIVkxD3x3JTgd2RyVksm+tYN0l5rlfHjSvcybttWuvtb
	nec9Mu
X-Gm-Gg: AR+sD11kZX8ecItPA2l2FCi5qF5U4ppZdtYzSRD6bB/gRVkW4z7XXZSKokKwpDLkUWv
	4vugB4n0+/eZjPomCwyKwYnsf/t/bx3ZeuMHOryjaWmhY4OMjdvn+AxCSpRrfOrROZmpUho9xRs
	5mBsVJ0OZ0cOEMf1g6Hvh0a/O9hwTR8yS0yXiMo6JTGFcxhdtvmZd2BKuo4GV+q/QCU5Y1HTmdJ
	kz0oBXK5B5+q40QBran4SdZF3z6+14jqvytznC5aB7h3up9PvmagEkfwbquZsZE+xPhnsPAsLHN
	Hd+X4Z5fxyO50ESDQKvhcwMp/Z46nX4wSbdv1guqqQbQUzqtJf4kI8Nb5xHsX8uHN0JRekXQ/ud
	4CQzz9d+m2y7IFCsGcVTQKMA=
X-Received: by 2002:ac5:c89a:0:b0:5bd:7446:e3ff with SMTP id 71dfb90a1353d-5c680ea208emr904046e0c.0.1787924485654;
        Fri, 28 Aug 2026 06:41:25 -0700 (PDT)
X-Received: by 2002:ac5:c89a:0:b0:5bd:7446:e3ff with SMTP id 71dfb90a1353d-5c680ea208emr904033e0c.0.1787924485232;
        Fri, 28 Aug 2026 06:41:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a30559cfccsm3004681fa.40.2026.08.28.06.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:41:24 -0700 (PDT)
Message-ID: <7b751d60-e8f3-4e22-8495-16dbd5163add@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:41:15 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n8aivwkAzaNIFHSvJmiurUY_CR9NeIsZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfXz8MIrthb6Ejm
 +x+gS6b2BJaUaYH2QKaDkKnP7W/1JzkHfV2sc9Zx+LGButfnGeeSQ4yoYyNSQx34hm0nL9j4yPj
 mVZh7bSME7Ifk+lO5NsKTtQCVY06lTbZ3aeU1RVTu23RXlZWMkC6u+ukVSdHGRlbjWqSzmgocEm
 smdimrXrfdYq8EjFn92EjQcccr+Sr73jpaYXXZwNAbAp0RLdfaELNSguDNVRnb2nMdyJtY33s3d
 1dVd8RaRa1ua3DrkKUyG8vF4rryfWgFYIlhYFYiy4M+PrZOIyeHVhflwZTbA+RTWKb4hFGYNs5A
 rDjreFkUhhl8EjXFVy/bIiZJ1N7hjZ9kV26AvU2ql5EZKTgbmporMXewG0Miuu6sL7U0NvZXqol
 xxcIkvh1Q2/G8TUVXokDbRp/tDhA3A/T1IfZEd3GVU5f55QX6nWZmV3XtvLRoO2AiSXVn0MeTlL
 5aCQM6FWkzupfx05uJQ==
X-Proofpoint-ORIG-GUID: n8aivwkAzaNIFHSvJmiurUY_CR9NeIsZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfXw/JGjQ51vVnk
 ebD2/FPgO2Ck5tFJBc7k9iuq09NLeh5KMCH5s3+iRVGKQi/JKN/lyjseNRKEGs8P+mbD4SivTCr
 23WTd4ykM3ZlLmSTtjSkO+hR3fyVbrY=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a919006 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280118

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in talos.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
