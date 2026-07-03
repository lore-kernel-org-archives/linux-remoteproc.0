Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9F53D25BC
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091232; cv=none; b=Q98qTSW/1i6oTx5h26K/T602EqdJj/KjYv5BayWMz+SXOWhplxxC/FnzRSFkAvg4kiyq3ZfEkHtXqOM9rTeA/Kidx9QPffkqwzdTjf9U8Jo3dG9R+IjjdjgWW2maBkibOI2L2EoN9inLA8fqn5FFYjsgiODp32Z/vUzI0of72r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091232; c=relaxed/simple;
	bh=0w/d6iSpR9UaaKp/rDddcaeduOnJK9KBBmjSerbTYtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIz3r17reXzmQJVqzKmBtEXRKF7g6qMXPqsMW4r/rE7LtqNxUtguT4p7YUZJY57QXtRPviBXfDr0lTyFFvSn0qJfBwmerUl1j078ymEB5+87AzDYvyyiGBZpRpM/W5R8hY4GFKVFDkEiuoH9zjwkBnYseGCWD4z6V0NPKv6Mja4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2laStE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kk2Nlrbt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2laStE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kk2Nlrbt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663CaNGN3144487
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 15:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/Y1MW5COel2wWx4p2DALR7RRNLnSVd1oYyWrSpSJXk=; b=I2laStE7JVO14Zny
	RUxphdbyneMw1OsRlTiKt0N99oI1NUu4z/tGStXgdRwGaWC+kYOJ+B0YCoFSgdZk
	3kFuL3t4LyLKsVcAQDoHbZBAdp6uHK+DAp1Lvyg/4TDPszJd3VK2f1OAfufBvxXB
	HWDTC78TO/jS0BMzX1rmYzGuPS6h6LYKvonLQlGWwobLQEmNeTVNVD4wtPSFw69b
	/YWG2WQvs0zTl/iG/65M0nNCwOOvyH982WAl8ISIzOHiWx6RisnoNPrGzuYlQBIy
	r2Ayt+rO6n7GP7/qDetmB7+9Y3D3G/UW048SZ4923U0oQOznFMwLEf/z/Q75j3d6
	OswDTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bsta5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 15:07:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5110c89eso15502385a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091227; x=1783696027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/Y1MW5COel2wWx4p2DALR7RRNLnSVd1oYyWrSpSJXk=;
        b=Kk2NlrbtX5tIlouE3x/4D2leuzq3KKQeJkZ6SIOpP4gpp+0O27zN+6VCWCeQthxtEw
         COoV1yLlqG2x0C1GWyGgS7EE0O3/H4eJ5pTDqKN6vBdI8oPkqHoxwg4wEsM5lN7INizC
         MLJUunjdENKia5ngfeMH5UkO8M/IzRjBUjg/6jyaAfHuw8qZ/QP1Gzi33R0XrTczBIPP
         Y5DRjclspOpKfHge5B+AkA5Et2N8q1sVrdaTUbPOtL9+BPP4FeUgoOlofaNgD05nObgQ
         yrgKIoph51MbdBib+UuE2TFfcvym3ohQBR3yKVI7oFOhQuDfC9vJdkjqhjG6ZkHVL+Km
         pYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091227; x=1783696027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/Y1MW5COel2wWx4p2DALR7RRNLnSVd1oYyWrSpSJXk=;
        b=OUTl9MT/m9/6lGmrpicPNiPBxplqWnXlu22ymKhwn+4m0G5U2jtGt8ygFcpQIMH0Zi
         LIvrOJMNs/YBosJTv4+UW2FDu+1hKButBp1AGZhKVQ2Vg1ZQv0DoT7ce+KEWH/kpsxR4
         rYWV/vAVKbDKEWnd23Q5V8HtcYGPmPq/9Jg88hil5wIv35MfIUn2qJq/kKx1HW3V+RNO
         eyyOV/oVPjuZFrFv+k+6jj2Pth8PZ59RNsm8OwN1LI17KLniuTmdPlzz/pC7CguE6RJ4
         QZ58MIEqGYyyohT6LeK3yus6PMGWWUTSeTI4YfpDsNUf3k4q1hSYlXS7aFO3QWoSKbHX
         Qzlg==
X-Forwarded-Encrypted: i=1; AFNElJ9FKUmNtUGo63ICZXxN4jP3Ow/Gr9oZtLAy1YHLw55ZwHOpr8LvHbtgrmw9iyhpFeBXT0MB6UlQshuYd67e6u6s@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/1zzrcnBZXVy8rRUbEuH/uaIhCWB1q0AUwF1ICaA64j1rCZq
	nZj1inc1VRTMjBY2acXCGA8cpEdUX5Q3X6goBHst2nDbvj6pgRP0NUwhxg0TnUkwWzTsae9PREg
	2PrygzFUHQnUu6GQwzBBTwLWz1+a+IvW5EDFw21+smHKvmofA9KuvhI4V+pL+Lo4Pi+m/arTB
X-Gm-Gg: AfdE7clv7sk5gy50JjXZlYcXsfawk1lmF/UsQqEfcGagYJI/9zd50qt7Ko29mHzeHzx
	/Z8VCVxE4yfXb48xrC+r3TnIhvknxOwJzG6B326pQbNNYGrMkG3HdZvkHioZWp6P2W4k97XFhmM
	NgLPU+LkS+A1F3+q1iVZ1+qEL63dgv2BJyKzES01JzqPlnwsEYA/ivGymljbtY/4M1YBORbRoUY
	7Sh0LiEp/pozNcrO9wMvQG6tgzRxWC1T8WLwbHLlz0GK8lFqeehyzqWxrGEpphO4fYzplei2XXw
	4vUeTIId5U6OsYl7h9KrJ2qmDWat+lpxDE0r4sUlMdfLRFnxjMLG0z6K3M4uiUBLTi2VrknRSkF
	f6oZqUJz/ULIZi8kGdOkX4cnGeWj+wktS80g=
X-Received: by 2002:a05:620a:171e:b0:92e:705f:1626 with SMTP id af79cd13be357-92e784f65a3mr825408385a.6.1783091226902;
        Fri, 03 Jul 2026 08:07:06 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:92e:705f:1626 with SMTP id af79cd13be357-92e784f65a3mr825395785a.6.1783091226326;
        Fri, 03 Jul 2026 08:07:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628d65dsm295433566b.35.2026.07.03.08.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:07:05 -0700 (PDT)
Message-ID: <a2dd4a61-2585-40aa-9d05-18b66f3450d5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 17:06:59 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
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
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX924cdSsKetzX
 QKRC0Ci1r+JiWJOOfCwgIiTjXj5M2SeD3JrgzndXwldYiTr4Oej690QGGDvTUjblIbBwG5zVSdK
 eardwVHXrlFl0wd5nfrdGt584XTjg0aE86N2GSZoHYItaeBQ59cHxdAoF8CQ814XzvODJIqSEOT
 H0rxV00niOEfpzimugj1ZpWydoODUH2/FSM8SgUY0DyWDjb+SN01pfBKqajdog+/zF6H+ziMvVJ
 sd8IehjAMt2TGRhSPL0O1/MIydhhirMVmPJ+1g+ywkDSxEq5yegVzTHMCqxuFlwQQ1mKMoaQxur
 0q4fDJUsFIE5BGrQf0mZ3PMoYHDOboxXmAb14GxmB34aXzyHqhukORzwxzbxK4BLydW7R8pXQfP
 QS/2D8Eu+fksuYR0wa5HwRCyOKn6YNVNirMevMVzNA6Gx2O9mnZ1sjxCm+s1w+IC5SbZaYsuRH6
 srd5vxh0+xoCkYaaGnw==
X-Proofpoint-ORIG-GUID: kqXVH3sCB72T6GghY15XU1RsF0yearHv
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47d01c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DWWpLck2SfFL7czMIZ0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfXySqXDnZWpNY4
 /uUrZP/Usr+09r2b0xg9Bbz8YiaUR/AcP2FqCQgfkTpi25nWz853x0OhCNgvX8MdQb7GDDXTtdK
 6BZc+vSD0M275zR9/MeRix3sgAGGEvg=
X-Proofpoint-GUID: kqXVH3sCB72T6GghY15XU1RsF0yearHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030149

On 7/2/26 1:58 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
