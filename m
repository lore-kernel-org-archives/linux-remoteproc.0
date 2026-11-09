Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260414;
	b=p0agbkLDd3C+mJmb54n4ItNMdeR9YrL15XkC1Wqd/EOlH2aSyREmxmFXM1IZs4TwrIIS
	 r97UZYbOWfG0OexVwbUpEuESDu0uO11U6WI9FjYVCEyybhoh1iZDaedhs9Aw4B109TJFw
	 Sfq1fazlkCHHGO1fZK5CodD1PIEq4giUl4ApTQKBydodgTW9NJr3YZ31tCU7r1U94Amv7
	 8Y5IyPUTF69CBL6fg2zTQFFzSPHwN0vMKSw0ZrWtVNdPG9eo6s0MukEPg2k44/h4+wKN1
	 rPVA1l9oxDFD+PxZ1Kwag7YPbBN0xxHbg9liR55s7zrjHxFfaRgmeZC8IuFMaiP2mvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260414;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=eUnUJ6fMsa+SK3hUNyUAZu2gmdqYdOP/pDefbHCAe7Q=;
	b=syCIwlrDXzZ48KcnuL1qz+M1GgnvC02cdzdtvd+fovA1rXQ12Ww5b4M2hoThQ4BkG4+W
	 oYKslVISJBrbqWC4NLvETIfKGQ28cQgtU4BuXryUUlRjZq4VH8dtEIzZ0BR71CfhUDou1
	 6oFHULmtX6gpvlWzn+wEgwmKR4FRua1OyvWfcgXchbGou6wfeFiKf5wzYl0+yv60LgLtY
	 Hxp8i36gkeicI2kGG7GlVcWDT7ZAcb1cmFcSN45O+KCsPg0RQz45esOqYorMu0RnvVxsA
	 bNJUPRjSmcC6wTXF3VeRKQrLorkrBil0+qV1OUbuqnRxqGLdNKe16tm26xCbY15Q1nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=OPqp04Ow;
	arc=none smtp.remote-ip=95.215.58.149
Received: from mta1.migadu.com (out-149.mta1.migadu.com [95.215.58.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503AE606A334
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 21:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 503AE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=OPqp04Ow
X-Envelope-To: linux-remoteproc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y3CmxKJ4TKlJACzMuZuQE+pA/o7Ia4zpMq+sD48qZJQ=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794260410; v=1; x=1794865210;
 b=OPqp04Ow+nGkU4H3wdzMQJYJ1i0HXBJhM4d4BfU/OALgyVQwKiZZJUcu1ezWpxq60AqP4Z82
 uikpnksGCnsChu1duGAn40lKtYhYHT6hkLnHNinDgxqcP5GcTIJoppYynNHhqHunBUnpnExfjWV
 qqJR7F6Kd4UThpAwVUD2xWBaezjCzAEqp/1Zzg+iX323vdNZ2NvcOYQdC7Gi9KOfjeG5/f7SgwB
 FM9B2jdZxTqxb7XG419jtCYl51ur2SA9yq+IR9ZUNqXpecvJJ0SOc7Logbopl9iYY0+YcqwQdAi
 yRQ5N5IOSwU5iO5LovA+PS7TIWkTckYvhi45yI7QC3Log==
X-Envelope-To: linux-remoteproc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 91629022a1c960c4;
	Mon, 09 Nov 2026 21:40:06 +0000
X-Mizu-Trace-ID: 91629022a1c960c4
X-Migadu-Flow: FLOW_OUT
Message-ID: <25204208-5fcc-4b00-b359-86fc5f124700@packett.cool>
Date: Mon, 9 Nov 2026 18:40:00 -0300
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: pas: Request stop before tearing down
 GLINK and SMD
To: Jure Rebernik <jure.rebernik@luxonis.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: konrad.dybcio@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261109175752.793130-1-jure.rebernik@luxonis.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261109175752.793130-1-jure.rebernik@luxonis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/9/26 2:57 PM, Jure Rebernik wrote:
> A crash of the ADSP that the host reports, for example through the
> remoteproc debugfs crash file, can reset the whole SoC on QCS8550
> instead of restarting the ADSP. The reset was most frequent shortly
> after the ADSP had started: on two QCS8550-based boards, crashing it
> about 4.5 seconds after it was started reset the SoC in 19 of 42
> tries. The serial console showed that the system stopped right after
> the recovery started. Nothing more was logged, and the SoC was reset 6
> to 7 seconds later.

I've been seeing crashes in sensorspd like

qcom_q6v5_pas 3700000.remoteproc: fatal error received: 
EX:kernel:0x1:SNS_SEE_I_0:0x10000025:PC=0xf00280b8:LR=0xf001f>

on a Kodiak device (sm7325-motorola-dubai) also cause a whole-SoC reset 
right after logging that, when trying to restart the ADSP.

Those are somewhat random and not too frequent, like once every couple days.

I'll test this patch and see if I no longer end up with my phone 
randomly showing the u-boot menu when I pull it out of my pocket :D

> Since commit 0ea50486978f ("remoteproc: qcom: q6v5: Request shutdown if
> crash is triggered host-side"), qcom_q6v5_request_stop() also sets the
> SMP2P stop bit for a crash that the host reports, so that the firmware
> takes part in its shutdown. The stop is requested from qcom_pas_stop(),
> which rproc_stop() calls only after all subdevices have stopped. By
> then the GLINK and SMD edges to the DSP have been unregistered and
> their client devices, such as FastRPC, torn down. On QCS8550 the ADSP
> firmware treats the stop bit as a fatal error and runs its error
> handler after these links have gone away.
>
> Add a subdevice whose .stop callback requests the stop, and add it
> before sysmon. Subdevices stop in the reverse order of addition, so the
> callback runs after the SSR BEFORE_SHUTDOWN notification and
> sysmon_stop(), and before SMD and GLINK are torn down. The firmware
> then handles the stop request while its GLINK and SMD edges are still
> registered. qcom_q6v5_request_stop() still skips the request when
> sysmon got a shutdown ack, or when the firmware reported the crash
> itself and the fatal or watchdog interrupt has cleared the running
> flag. It also clears the running flag, so the call in qcom_pas_stop()
> now only sends a request when the subdevices were not started.
>
> With this change, none of 104 host-reported crashes on the same boards
> reset the SoC: 40 ADSP crashes at 4.5 seconds, 20 at 4 to 15 seconds,
> 20 while the ADSP was streaming IMU sensor data and 24 CDSP crashes.
> The ADSP or CDSP restarted each time.
>
> The problem was found, and this change was written and tested, with
> the help of an AI coding assistant (Claude Code, by Anthropic). I
> reviewed the change and the test results.
Try not to provide the free advertisement right in the commit msg btw, 
and to make it sliiightly less verbose.
> [..]
> +	 * Subdevices stop in the reverse order of addition. Request the stop
> +	 * after sysmon has asked for a graceful shutdown and before smd and
> +	 * glink are torn down.
> +	 */
> +	pas->stop_subdev.stop = qcom_pas_stop_subdev;
> +	rproc_add_subdev(rproc, &pas->stop_subdev);
> +
> [..]

It looks a bit funny that "stop is a device" but well, it's not like I 
can think of a more elegant solution…


Thanks,
~val

