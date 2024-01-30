Received: from smtpout145.security-mail.net (smtpout145.security-mail.net [85.31.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5291A66B31
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=85.31.212.145
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706610074; cv=fail; b=dkjGP7cC/z+xlyqub0jhwVFCWLwR5QFxyC1rMfROuaPRsrY1DRVnGvGC1THqMLE5iN1RrbOOz5qaX8tHwinAqfH40o//4rEBnB7szNFqlPFr4wYwHyaUBjtXVdR8yymhaKZj4kK4dML5jqvHDLQDkrEO5kmZ/+OyTKl7kpo12oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706610074; c=relaxed/simple;
	bh=wnOxgJoVASHG8wo+K+W4xs0mbQRCrdos/PjsFbEDzpg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hQsQBXAOBg4RouVxOVFz/EAvOv4h8ppZ3F7OSlNoSsHXr6oLipMCdK1pBBVk7GRoYrTPgaKVTxTHJ17N4ZhWVVjjZpXNP/0+nYANoqUlowsxCO0cMrB8XJBAjQwKHYJbzyiNdf0/QmE8pyfKu34jZA+OR4YaeHOSC/Fo5p9aW2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kalrayinc.com; spf=pass smtp.mailfrom=kalrayinc.com; dkim=pass (1024-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b=L2niFtad; dkim=fail (2048-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b=hL64mJoU reason="signature verification failed"; arc=fail smtp.client-ip=85.31.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kalrayinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kalrayinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b="L2niFtad";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b="hL64mJoU"
Received: from localhost (fx405.security-mail.net [127.0.0.1])
	by fx405.security-mail.net (Postfix) with ESMTP id 5BC4F336399
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 11:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
	s=sec-sig-email; t=1706610064;
	bh=wnOxgJoVASHG8wo+K+W4xs0mbQRCrdos/PjsFbEDzpg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=L2niFtadro807K+dol5imMcGS0Q3KmrHDDe+siXzM+y+OQloSdcYCz7A4alN3hRJn
	 aBiwN90gd7a/Eiz/6U8823DQvucjKXxW15fkRoUgFZkrqTOqH8KiTWajgxNybIliGN
	 wxty5ie+n3FEojWJ/Zrcx3dxF3daTNGeL5nrGvAk=
Received: from fx405 (fx405.security-mail.net [127.0.0.1]) by
 fx405.security-mail.net (Postfix) with ESMTP id 0FBE1336388; Tue, 30 Jan
 2024 11:21:04 +0100 (CET)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0101.outbound.protection.outlook.com [104.47.25.101]) by
 fx405.security-mail.net (Postfix) with ESMTPS id E732833631D; Tue, 30 Jan
 2024 11:21:02 +0100 (CET)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by MR1P264MB3121.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 10:21:01 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1300:32a9:2172:a2a]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1300:32a9:2172:a2a%7]) with mapi id 15.20.7228.035; Tue, 30 Jan 2024
 10:21:01 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <107b8.65b8cd8e.c3f3c.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g60eQKtUcYe7ryjqU3Yc8UA8qA9UflD3Y3hQ9FmzSkixRaqk8B5DSP95jx9tpYpdDKCR7fiebIf7yLTIbsp50L1tm9UHhYNZ2/8rmOkb9ACyQEvLgEu4PNpVJudUUSHrTvMeulyfikLaFSkFFazlrNWlQRCRBpkUEdzrA36YipBkX9TyvMrUiKHsPowHcRk3ViZ7bngo9VdXGpskJny6wPe7zRT0ZrRRMxmyzeKor3rPMikrw9LQMCKTy0wVkSKdyYX0GsYrm2Gsvpl1YL540Ytk222hDaZn4XhPCIIlO4TL2ayQww8dB207CaWRZZ+cXV8DvR/LVV66b+bi6WCJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1Bu6EiwqeIV5l8QAVYVTB9862fCrm9g5h1drfrQCc4=;
 b=R3zlmDwJ+gCmj5XYRbOvrVtNWUFuLJWB35cgYUd9ZISwUFsEUkscakM0QYir7Ya8bxixgXGrb7I1yhCggYxgDyXZkpWqsYzN7RG03EWWpoLNQnMxz6AbDqoM2ACjjSeXkiX+qBh9OhCgIKG/2v50QOPxKwj3nMHzP8P5T5ZZ5Kt9J/uN9V7bO6WefTwRt/fblsoHb8ibz7aDoCd4W16Yc7r1R5pwLaDEqfnBsnTROv1Fua4IDMQF9frAGuRBxlD74JmUgC7SNfVJLyL4Pur7Py7Ke6NYEuKKCdQOVJOd3fZEIrP3Pg70csEMAbdZs5fXUdieOwwp7y1qC/oxzjibYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1Bu6EiwqeIV5l8QAVYVTB9862fCrm9g5h1drfrQCc4=;
 b=hL64mJoUyPeZUt1IUSOkFo6rzXSeU+9qQ6lpMrOLcg208Q39D7wjXVh25it+PX/4Iganye8C7dRp/OeiWA8nPMawkmFmTuuWdbsiv8IhRNG2w7+9AGshK0sY/j8l26ClzrjSb340UJHSLSIQS0nvyRTUZXVUX5Qlg4DRIvTVVuJYz3GOhCeSzfCNIhevyyCrM5qN80gi3Ku3TQAjUE3yv9SWlW1qC8PP2Q5bNUigdgf4G2UsMWf+Wi/qmsN/pGw2asUapLC9hgVwHjaymkO4kQQNixLorxo6FnuRcs1nRApCDBdKjT2WU443PkUHEWYc7vEa/mNrkgnczZsC2dOeLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <f67cd822-4e29-71f2-7c42-e11dbaa6cd8c@kalrayinc.com>
Date: Tue, 30 Jan 2024 11:20:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC] Passing device-tree to remoteproc?
Content-Language: en-us
From: Yann Sionneau <ysionneau@kalrayinc.com>
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Julian Vetter <jvetter@kalrayinc.com>,
 Jonathan Borne <jborne@kalray.eu>, Arnaud POULIQUEN
 <arnaud.pouliquen@foss.st.com>, Julien Hascoet <jhascoet@kalray.eu>, Damien
 Hedde <dhedde@kalrayinc.com>, Titouan Huard <thuard@kalrayinc.com>
References: <9c32f94e-869a-16d3-6bba-064082518ce4@kalrayinc.com>
In-Reply-To: <9c32f94e-869a-16d3-6bba-064082518ce4@kalrayinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0010.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::7) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|MR1P264MB3121:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d43eca-c2cc-4bca-a912-08dc217d285f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wLxWuBP00+dyXez1gnIA5ejX/6y1JjvnGNFQDMWtNnh9UtOQxeJbh19aguugK1f6sF6y36tu0d9RA5jzvcojOYe9J2j+IKTbawSl2dSvmVjIgOHyL7bAV6TxBZOn443mPASzIxNHMKwSbyp471U2Al+SzPY79tnN/lL8PThhQS5RDPtegfgvXqRvQBl0paB8BW4RUq2vHu0jPaedJqwbfhB8LVxpZIqfCzN1nliMSodzhClHfDioSA0XZq1X4/Si+qDm9A/9z8ulvDyjOe0wGiYnL+T7crmPsq6w5ICNXAT8WOQobBQVCpAs8QrrIto310+Nql3edRth39DnwvTB+WnfQCyaexImeLjoxxtu1dngdV2WURFbSVLSW3/9bxIiOkAhj3KaN2Ps9JfMJYRrSrA+MrK/bqUw3Pq2idubvWKm9f7cfJ+bf4hXaFDo/5IRTcmxQUOBgM+0d75a5DxdirWkGtAhz9/G99kuMzc5WpRFD+RfkjiiVXrm57r5vSotPlg30+SX1fanhQ/EZNNoWVO7pkWq6ISESLvMqEucU6Una9k8AgOYT7zW8CBQ6Kqfv9j2Im4UUlYevDRohZ5D4SJX9/7IvAKJkx+EhONkvr3aUa+d3Df8QwLyU4NJVIVrramzAxosNeHA5XQ7Cf4qew==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39850400004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(26005)(2616005)(107886003)(41300700001)(31686004)(316002)(6916009)(36756003)(6512007)(6486002)(478600001)(6506007)(53546011)(54906003)(38100700002)(31696002)(5660300002)(86362001)(2906002)(4744005)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bkEFnqayG5nQuoCPfTeG0JTlMTOc0f8cZ2+FUjtQgojX3wutfNDwofx8AaWqGIOHzVmzqVJFzO9osYgH2pORdkxlVbppYvJOM2bZnHDQRjLu+HBqxevp3tmrJzMtagV9Ia+6g9SAGH+Zw/Bkn+Xsrh6Wm2HufOO7km3cmZV+Z003UxQi4pWeJyGGNZSu6P8Z0/K5WBDWybpBI3QBj61ZeNGAn56vWdf9L+NaapoywdBt8DyczdlkjXDjGNBFAItChnyIhM/gSZUg5HZI3ReG/ZPyZG7ipOaHPSD9fiY+IEWcCK4O8jOQJiwKDjLwPlSzC9OUMDwDd+8/OQgPUybc5nydZGfl0fGGBvoEPrhdzB1+uyddibyL4mrfuqhyhJoASMBQW077sjF5h5/fuTTu2MwnCJN+e3VYmBNHyE9QfZhUOFItrSM2J3wTbd7F1fiuyeH0c1uDzakZVhcHHBc+KCqCdiuwxSPl1mWfZ0yHTNqagoAh+Re0xCzuk5c6uSQ5bKbUFPhxzhOTDrtu7moCoyjggvr9stYiWoibTl7ezVpUS298zXN3Kvnuv5pBn+tRwgkUBx5TmCbd9BKRHJIa3Q3dIFjGK2FnSEk0tukooFdvwc/pl2VL4JhfCf7llVdCm+LWMBJUZ7YgAusFI85cKe3Ip4rKYRXtnMH4QG5VMpwEympiVsDey37Kl2417Z92MMRvs1W1lDr896DSSv7UgkOaONbrMP9FlhhDSUpPjeUFlz2DNG6sf7MJpcUZWvNVsrG7PPxBQ+ZVRidJVxOFF4gRe+2hCeas64fWrTzoMRL9VSd8XpNZaU5jdzpO4vVMd5hI3TQsNEyycflDIlDhmnWJHDK7HWs7JJDWFz7JdGbqn38y6sJ0kD20xR4xHz9ITVJGplRFWgBs0lehTS+MgHagBGcJPNwFMSingm1R3zEAw28I7HxC/XngwPRn2Fa9
 8dxOvD8dKBS6OtGO3vzKOKTH5wokOfGJhBctVpL+xqrb26r9h8AAyWOlkJcvnrFSVix8Bw4zyHiQreGR39n4dcYEOE3gznFxyFpWGTZYBGa/Iz7z6bCX3KO1gLHSnvgsH95HFtsNm6Bb4qHBitczeUo5MQT7ETEg536jH3JpaA8TW5iQso0lbxBcGv7elqus7p+wSxYXwj/iSH2nTDhKMXfHyvMFfLlg0ZTqI+LQm6rQuPApEIuj8sAq3uFCo04/+LIRbNPGZ+MnCNwV0IGQIevYdJsqfRzuNuuj2XXVoxYF6fQ7CYG9qmr0OfBVlxKJlsIrRJTGDHdnPZ/eX4pYzpxhDGs0DABwHgE08/cfWzB2Pi/iTFXQZMal+BmKOPSP3FaaOIZ82HvhWrLSVDCbS0ceIMctkkbRc0SzNhIOBggnTi6xP2mpufoY4Zf6GpxYH4ioYOFk8U6qITGohRWm6g0M2L/lCWouajovuR3bYYGRS2O+3kILXPDuROB4EjFCDyf8ccnNBsAkKuTl4VYPsmmti49AYwbwrbgZhash6FiH4mcNyNTtlVv4X+w2n0hB4Q7mB22LZ2GxRjZ2s5vIgcQ71w6EcRHCtJCPViJ6EmPMktmON0U82Zv80eV+Rh+XXYGSwtFZEP9U5MfdqEciZA==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d43eca-c2cc-4bca-a912-08dc217d285f
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 10:21:01.3269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXFy4LGv9FXz+WOpJMjklMirqYCUaxKwIm1CSIBDBJ4MyEzUdjEeZq5vTJ5dX7DKf2F/unyUHBUFcUH3tgd6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3121
X-ALTERMIMEV2_out: done

Hello,

On 1/23/24 14:32, Yann Sionneau wrote:
> Hello,
>
> How interesting to upstream Linux would it be to have a way for Linux 
> kernel or user space to pass a device tree blob to remote processor 
> when starting a remote proc FW?
>
> For instance we could imagine something like this:
>
> 1/ user space does echo -n firmware.elf > 
> /sys/class/remoteproc/remoteprocXXX/firmware
>
> 2/ user space does echo -n my_dt.dtb > 
> /sys/class/remoteproc/remoteprocXXX/dtb
>
> 3/ user space does echo start > /sys/class/remoteproc/remoteprocXXX/state

Any opinion on this proposal?

Thanks!

Regards,

-- 

Yann





