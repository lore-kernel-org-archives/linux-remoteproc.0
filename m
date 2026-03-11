Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF042E7BD6
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194655; cv=none; b=Ah/wmQ1Dchg3B6c3IZ7eiL5RtkPT+VIHHRi6AU7WsVdyvWIIJVyKF4XBu1IJOBwWx0HDdLSIF+b4WpPfzWEYQokqK0eYwtSWvHzA8scCU/5wg8fqp122DeZ6AeYy5VYCeNH/DilHdExtijKyMwQKa0ARjMKgNzZQlxvvn06evqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194655; c=relaxed/simple;
	bh=KHpLEJ68eQFWkvR+yjWd9+m47G13y/6s9vJ/u0LOTww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsdjS8EgttuM7M6mdSRRhb7jtuAp64qr7HMP1Uqk3r9d7GAOu5UCoV77wN07BZ/ozAk8g2X7GBqtz5/+KWTkIT6H9rXYAzSRbgXM9sNuLU7aKaBgoORx4gUpsZI2gJT6E2MNmfhShbrU/TUO/Dpq/yPzv1kT9kjI1Pty9rtl63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyitJOh5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuYvJbOf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyitJOh5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuYvJbOf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJOD5o3417778
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=55ZluhAsUgJCp1Aiy2a9rkW3
	IsaBNQFJQI+2xoKo9q0=; b=GyitJOh5XG3aUJ1pASJfR8XXnebSCDMX92yIfMIk
	l1yz8dK+0qVfuOGvDuH8fkw73l9d8v/lXZpPcoF6fiF8MWf3HOieVLHJNZ0YuYvO
	LNVBO2DWmNGuvtRCXGB3UpocbXsmf6fcVkO3iTFdipzL2NaXDpzm37/WIEkZLqe/
	Dp9FmoktkCjBq8ELIPUEKkH3Ij2tUDytehIEsBk5rezB66aUuKzzu8YD0qX3ZzfD
	hbDbPD3IdDhyB+ecRiO9NVpPRY4XhlcarnUI1QxD9CPsLefxG7svikF099K5vkgV
	daWHyPZTCrX+4X8wwmLMAt6311/Ss41ynIswkLuphnzbfA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2axvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:04:13 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffe4912235so5809397137.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 19:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773194653; x=1773799453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=55ZluhAsUgJCp1Aiy2a9rkW3IsaBNQFJQI+2xoKo9q0=;
        b=JuYvJbOfjCdGqreKiD6V2xxjgIxIqMaK0ISyesB9yUN0zIuSt4c3dpjWlh9RMZEO1F
         tCbIcGXxEf8ok4n5284WGMdeN2U4r2odD/UDQ+DaEalMZ1t06Ig17gbOKkCR+QugS1kC
         YM4pKyGP8DoK/8MNo01Dz+Yu1Y/45ttXnNJmlgroSsNjpe05DPxb4X696yyTFdrKOVJA
         LhsaanaxLp178k8hNagcEQNQvnh3jZ39BDMDERd04Gsj5YqZCzt9HthikA6VE7qXJzFV
         zpx2CpdotlttDh+DesjGsWp5qnd7k7kZYsBp9WcFtm2boT/bzE4BfMZrpgQiYXzp+nbH
         TKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773194653; x=1773799453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55ZluhAsUgJCp1Aiy2a9rkW3IsaBNQFJQI+2xoKo9q0=;
        b=SbF0J7QI9L2DqnS/918eR8EsjBHV2XNULvVbHpNty4D/vI0qtP/fPiGt1B+ZsFBX/8
         BHA1zWyQoobaxGQVH6mA5jYXawgdPAVsse+wbI5wI83hak03UqIwzf5855hJuflVB2mT
         qBQFN1kNt87/pl9WQxVkO4yFXbrV43INbYfb7G68XfSH/oeDWDXermBPczj9MpqVXudI
         zMheNGmZTfp7+hmPUPcoV0DHdFKMt+sYGVv6F2zq3BMJwEZDeaMyblFIVsKJKo2IHiaJ
         dAXCfh9FcEYn67JdCFHYwFx1tKI9Z0zAzAf/NlQAv9HGnDzVhWZwq2icsih3JTJLvNga
         hjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpo3unKXFkeCFe9FmDq8X1Poo4uwE68WV0pbiFmATZnlw4ERXbO6Z++SShtG23b52RGYzCeioE32+SzJbEMqYr@vger.kernel.org
X-Gm-Message-State: AOJu0YxSrvhFooZb9+iTY3hX/p7uQ2JMC4jFvtxnfQbegylk+FgtRmhT
	7T1XnVjuV2qNIoDG5ws6brYce/7YvU8iU+TA8G4Xm/DKF1z4VpGzeYD12ysox1qJkKIiIm5TvAM
	g1Kt0bKdLyNJRmbccGcOGQ5Guo3FbwYHMmp3daQ3PSG3vF+LcHKf4sOjDod8mkneRUkyC6y6e
X-Gm-Gg: ATEYQzzth6iEHyLse0R8CO2cTM3X951j3A4P3VVhmjcRUFZ4wwXeldXePIncdQAFuzG
	+M6AyuCdrw+FMvfclPdITf1KAsqhDO5g1yJEm/2/p5hE1tFJfHNQtYH1ZsJm7R5scEeCBBbSuyw
	7k1kh2TxINtiYxVXJ/rB2pG3XibBn4XuKH2ZR9XoqldCjmjOXJMYuV35ji0/ED5sS+j/t0ayuyr
	en3ct2i/mugNIv5vR23VTlJbD7wABzZBBwiT8fKPGGTlNe3w8BiSlXthRBiCuY9NKUmUHCAPbzx
	uiaizage4whPoycofljAfAC/znI2kF+/j1EVXH9sOXvT1ulSO+g5V8iJGJlSnZT+mmWt+ZuccL5
	1qvd5ypvyUYRSrw9XXmpAOhV2TLqwzFob2T8PMw7QWa/E5nWwfG7RQnexWAZ+3aNRP52V8q+5DE
	jEaocgbAYbUNOThMUBDYC9f3UOyNJxaE/yikk=
X-Received: by 2002:a05:6102:548a:b0:5f5:2ab7:cef4 with SMTP id ada2fe7eead31-601debc1b5fmr415389137.12.1773194652615;
        Tue, 10 Mar 2026 19:04:12 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:5f5:2ab7:cef4 with SMTP id ada2fe7eead31-601debc1b5fmr415366137.12.1773194652157;
        Tue, 10 Mar 2026 19:04:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm1065081fa.22.2026.03.10.19.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:04:11 -0700 (PDT)
Date: Wed, 11 Mar 2026 04:04:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <oqvq52az6iknhg4negqaprfsx5dfo527acoeas3tusqpqvak2c@wrdmsydyy6ns>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0cd9d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QtJ_nAIye8hM5DG0jicA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: h5ppz-0gMn4beX8QF2epZFe0O8enQRJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxNiBTYWx0ZWRfX25drfC+ObqW2
 6q/eOr7roSh4+rTbE34ra5+D7GUJDBggvKEl0gPjmXSPYgpOevBOrsJ7b6DCOB1y1QcwFzJoc48
 dGk+7LtdNBP141ct5rZLobPw4OYZvpeo00h9LbdU6ED83oTfxvS20Z9ks+/tOYOVUeyWOfeZ98A
 OuypyKpdgjnb3zBuxc+2mi0RTw05DCDWyxZQ9MzR0tQu4Osq20MOxOHBxEhBo37Ilce0n+PI2su
 Za8QL5KZNkcsw4QRI/GBRrtm2rfNVLzJh64GfTQ3rFSQQLCbkHCZQY4wHYt2AYR1WFr7TZ+TyQv
 5by0eBYF/f6AU30WgWvu8XaRqcC8/CiW+jdlifmQ2Vst0n1Ey1EjgKsUIMAQ+JPzsdnT9KxM54Q
 PPKL2TwWWd02JzZ05ICI7FlwAGe0bXzGhElxzrjcqHSdm9WhoWTvbA6YexZvZd+eenS/NbUyWn/
 UHws3fhw9z+mUAoDOQg==
X-Proofpoint-GUID: h5ppz-0gMn4beX8QF2epZFe0O8enQRJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110016

On Tue, Mar 10, 2026 at 03:03:20AM -0700, Jingyi Wang wrote:
> Document the component used to boot SoCCP on Kaanapali SoC and add
> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
>  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
>  2 files changed, 159 insertions(+), 1 deletion(-)

With all the changes to pas-common, what is being left in it? Would it
be easier to leave it as is for the traditional DSPs and copy necessary
functionality into the soccp schema?


-- 
With best wishes
Dmitry
