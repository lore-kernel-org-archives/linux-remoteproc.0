Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8906B40BCA6
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822956; cv=none; b=DBJwzfI+dETPlZo/mWBBcYTgeB22epm2bbma3psjGQyl3asHWwPxwgFszJh3CcKyfCV/sxmk0XI0urB287U3YBP/B4PLlV+dPS4o4vialoxsDEJgO9iIfoToTztZ1q3jfWk6qGxsieKe4Qv82EGIjSgn62zM5PJ6FxOQR9JUcm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822956; c=relaxed/simple;
	bh=vLLmYFCrj1ZpLwPqXPaPHpgTs7bbyh+LFs7PAoMXyh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgMyvIfkTyMfENIQk66tfHiRILjdFA4I6+jpCYebjz7x68RJJnDNU7jLGJGQHYStlc2Hnv4ESCgtLCi/VGhqscYsAVWXYQkv3jge5WpPE6IxQIpZqSAlfmFynVUXAfzKiMoMi3L5DUvqf1ue+U106eypep8Wx8+aRktnfcwGoC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGPyUaeI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRL3tjB0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGPyUaeI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRL3tjB0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mk3O1602525
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVybOcRg16XfrgNggKu8Y+wvhvzwAUuWo3+dmdHPhFw=; b=TGPyUaeI7PD0l3ZD
	RXUKwjXocsLqVkkLw493t61d5m5eW5p+GjrblI3HaXwFRFAJyCt8ufcYOL5UMpRs
	ubYftG9AINmVA1xjbKA4MA4O8GENkvzEA/LJ66khEL8Q2SnIjCkWThxNI2Exinrx
	CwNBvO3PSUzn8cYCaTzD5Sl6TUsgjTLZsqkyo89x6+0b/eEMdkChPeMQPDfXxqtc
	xb8mu5qnGtm9zd5IB+jXQLsXM9qt5GxT54Fx/vfUVEYcCnYa9T7TQ6r+4ITYjvUP
	hEA3g2zC/RyAeRNdFTCngAhd1MZnNOYdxGSs2+9rKxnzRV74z1aCc8adLqc1zcet
	HODrGQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprwfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:35:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692c7b2054so92510241.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 05:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822950; x=1783427750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVybOcRg16XfrgNggKu8Y+wvhvzwAUuWo3+dmdHPhFw=;
        b=DRL3tjB0C1m+OndZqS/nYckhtm82nBsO+yYyKPkTfoIPib/7yW6gyUrs6KCNvlqAjW
         +2i49AIzbuscKiBkR6sW5K+3bNwp6TPXtVagzVqDJUZM5DztcPlaL4zScLasgh0EhzhG
         UXXwaGy6dUoFe2LcuGAKpFcVWiOZ3UhOE9j0i4o9tvcntlSaerDSWcyvYq6+BztCvY++
         A9TPvPqxATrs4ZeZYrv4bfbm0n9QSKankRoPibv1SYZ8uOcyU+Ga6XIppjt4QRDNv8DB
         Mm41e5z2LPmBrsIsWBQzOUXw9veyw/HItWOeNmPLxb2FYbwDalIRvLeq5aqlvU0L4I9b
         ntzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822950; x=1783427750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVybOcRg16XfrgNggKu8Y+wvhvzwAUuWo3+dmdHPhFw=;
        b=eWheJaxiOhwf22VFS4EcFkfVN3D0tCLRvHhBSRSduQLLWdk2TGQpUJMlkjfe68ISIs
         3nJ9HA3BRtKauWLJ38y2icpYyiJc0D4Oui6rrwFjxakML/qatqWoLhOLTRBy08BHUMbZ
         OvdmBImFmcLxHyWCVApEiEmaQRJ5fRREe3veQUUTplto/Lop+N+iywk4hf+5/JzRokeg
         BUGjWaY+Bt+a4TmzIUw26VxxZyPwnb+PowUgGzbjX5Rvg24G4jH4PwC0mAm8iWIvIt0U
         zNYQW/wmRLxnWBikSzNxbMIcjUB4ZU1L/5XhqQG6QbVSdLhXjjRoeBzjU8Ve36qSj5X6
         8/Nw==
X-Forwarded-Encrypted: i=1; AHgh+RraUjg92TqJDmpsGOFa/tAV4TcLBkvTEXaHkSzPZRfI9i3mKKH3ViYZx5yWaF64+zNwyzW1bbQVlbpVuGsPdmO5@vger.kernel.org
X-Gm-Message-State: AOJu0YyeyC2J6atUwyPkJxsrFREV1JLxuDVflfqQInh/W7imx5p/Pywj
	udBCyCxKC9QIt2ainyocTynw8w1PDZtJ+XXJZ3dLUG2FFgpszHycowZjgfYP9GxNtw/ULxyoHMu
	EKlbYPGf4k0docy5xJMJsKn+xPcRJF5M3+vQTEs/O2R4ZhHz2cjJ8DWes80YrgqMaF5d+hNuE
X-Gm-Gg: AfdE7ckFa3nheqSw1F0aU1oov/WHEFzbmpezkSU75MZZQ6yWmF3aj9wVBGxZReLZx3y
	IYqPA773fkUI9FOTpw0aH1AjCqz0qKlRKihmF6uW9KcrkmpLzXz8EkQuTic6+nonY+ka+kaj9wD
	RtP07Tk/sQuyh/LRT2G/oTr8dE3lAR22lqTL1Sn1MpMnpf/2CeZ2hnVsfPIl8sg1rgNmrD+2VxI
	Bv2wne5LgtD3nSkbwiwpprmgFgQgzgj/zalW/sroKRLKc5IaL6amsL0lUct3V9NjOGHbDgQHZpk
	0hP5Hipyh7hM3DBE0dhrYw2Q15sm87dvhMxyj/nAt5r/m24av0jqN0/bSJEdy5xPggBdvnMxS3+
	ZibdeUcNo2jfbjVVfam1/MIJ1d/nQwv56pkU=
X-Received: by 2002:a05:6102:f89:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-73a333cbc93mr634711137.0.1782822949915;
        Tue, 30 Jun 2026 05:35:49 -0700 (PDT)
X-Received: by 2002:a05:6102:f89:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-73a333cbc93mr634672137.0.1782822949547;
        Tue, 30 Jun 2026 05:35:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69885c9e8e8sm441434a12.16.2026.06.30.05.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:35:47 -0700 (PDT)
Message-ID: <049a4aba-1c35-4a47-9a34-25e76ae8e72d@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:35:43 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/14] remoteproc: qcom_q6v5_mss: Switch to generic PAS
 TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-6-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-6-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pzmG2gHOzv_VdZObgBZe4ugGAXMpMSaF
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43b826 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Vkn3R3B67r5ClizzeDoA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX7Y3e4njxtvdJ
 KmYuU4sen9goA6RQCaJACbj7IVuTe1iTLt1QnXQ8AOHDSDiEjH3TIhf+MuEGe27LQcLLo7C/3qL
 84JHi0lahr831j6+Yi9Efa0Ee9yrmrnwG+l+sr9LrleS8GD+Y8dDKQ9B4rQAzkd2X/wrtDaFGWP
 N2FKhtCN8fmk54XqXBdQpqh0uTzCY0YtI6aobvLiP2T3+8zkn8fRvTOj0JiHLmmK+3nnhP2vNfw
 40fG8XS8OWPOfmxkiYXwaTP6vM8z2keNF6iEPhjnnihXy90XeQeHPBDPbmb0ZYKkpfIdeMR957Y
 0DNItBd+U9J8fyDWUkp3gRUM9WI2clRcwVXuXcCYbHRUtr+sirHoMbqF3H2dg19SL79RAtEJSEa
 V07RhTDzM84XA2JaYeJIalbC+Pkt3Q2TlwEW5cnUGd/sE8xc0DzOBAmBP3R1bnJdrTc31FKPmmt
 +X9SYx3JzuRUHqipZwA==
X-Proofpoint-ORIG-GUID: pzmG2gHOzv_VdZObgBZe4ugGAXMpMSaF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX+u/t5m2LxKS/
 YPNYXLPhxvtv+XRKoh3J3dCuJ8an+gF2IvDR/4MvxGpn5X8uFqnt2SnLBwS/vjvzW5WsPuFeTrd
 aF+/SucnA8RLQIDCGh0tRShjjIZ7aHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_q6v5_mss client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
