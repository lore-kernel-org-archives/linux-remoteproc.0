Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354597;
	b=HLv3uFHef5cKG+KfMCu9qwzcCyMeRi1KFSWD8T5S85MdS8DpgxGVN7Ioc/HJ/DU0hIHa
	 1d5s2Zs8OySqBxtnTrcAIVAh1TcqgqRgwO7iiC4Cs8B0g2QC8NiMm4Af+qJsam7huDlfP
	 yht6jNvzGzSWuzL882iz4XEzuhpK8/RAJYvOowFlFYua2dr2omy8bq2/sP53kYpJfxsEm
	 jSGDZgse3l4xs6X3Zbb0h0RG1LGEf2E8suvGvIxImI3RfkwHrOQDG+OllUdGSLg6/9WEN
	 ssuB4vUuF6rSniyB9eH3ojQ0zKQQaMm1pw7PPgQONtkiYrv8KSd7vVDzD+YK7uuBGVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354597;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gSrY2znnUbX/BQQhtLE0UHmVPEjfpEtvIoqty3TSWXU=;
	b=gfsu42uVm3ZhcL2HwtEZZRvmLrUDP/vHQkvELJ4l3dB0gcnNv7M+BBvsOJBfVk9ssrQM
	 zD/pptHvHQ18oWWaTNLS45iHJyKnm0O/Pv0nic5aObBM/8RA4FvNWX/YTlovVHlho7qam
	 Y5nqNHhb5FdKwvcgkaEHWDj66VWXjbyN+2VAUEPQAIQKV7FqhSQDKDPo0JIIkMdm/sNQb
	 5vqaj5164Bmq/Hi8dwFQExv3sYL50sWlAmYLTJZQ4TEyCYcn9Wpwb432VhSEtz7j2gzA1
	 YXysFruJMSBejqKj869kWYbhKFI/JivdSQXNW86PZrQfJAwW3fQLiRXItXA6ib0Q4QA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IB7v/xZp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9F4606A32C;
	Sun, 22 Nov 2026 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IB7v/xZp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354597;
	b=b4EqdxSBDrJxw9dRhn88BAX7vm2hAk5NTbslb5umQ/MFsC/KJf7O63h/c6BWLSrPVhLG
	 UHZtJzY5I3e5xjkhtmHcB8xvrXCyP+HswfuV5MetR6KfTHBqXNSruOy+1uMoFUvq2oCe7
	 rc2mgMBbhzvzIFB8Ck+crndobRxIxGJkbfoJ4vYv8OL7c3+IlsiVvkpIBpm2yclVu7xic
	 6pZ9BMn5dwUrofVS+CyYlgD0nzUjvuEumQjA0wkR4vhPSJOm5IaXvqvfxX6/YnDUVr9UH
	 5z+asLexrOZ9QIsY5djVaAguAlZ9bvy2F/zcnNBpiDfyY9PKKJYZXLMZwx+AR/QQRXQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354597;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gSrY2znnUbX/BQQhtLE0UHmVPEjfpEtvIoqty3TSWXU=;
	b=XEIjwRRJ8OgEPOfBDx/iiwNlII74H/EYOdpkr3ZSi+ySKB5CDv4EwZxC8p3GKYOl8YRz
	 UDfaJ3W8FC5mvBrHKGMakOsN7D21OwpGd5o3yVBcnWh68ot74+fdXKwfKscUZFo/atDH/
	 rgDXCehRb3U5ddn3QISi80r2vI8Uon844ELwdrRCUBAzXBNMFt0Zrr5T/+/77yxZqeL8L
	 UdJHgNZNNtq3rDm4GSs9oqmgtpYTcfGo74t0X53sF+O83GKzI5xkzi4+4DmLEES9+0a4F
	 B0r7//KwC6F0ly7ovbm0GSGNtGbbBwaogeBHneZhb9X5k7or+Xy4kxh6zEI6E9iJT6A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 842F61F000CA;
	Sun, 22 Nov 2026 13:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354597;
	bh=gSrY2znnUbX/BQQhtLE0UHmVPEjfpEtvIoqty3TSWXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IB7v/xZpANWSabAKf83Gbr8VI+wQN6CWYclBpYxIm26WEQhk/h5K0HD//1/qRIQ4b
	 F1DwhguvpQkpi9zC+7ybtxfs6wjiuiZq3LlVK4kRe5lKqVeprMcyablGbv+1gVEZS0
	 pqaA1Dh4BHLvLXPLw60j8HELxrHf1RmAX7Cc7//3kTAUCCHO8Pom+iFlynGo0eq3Lj
	 /l0kxBoUW6Xgj3ZTt0RlPQ840MccQdgYS6VPDUF8XluxMj2gSR/a4FY4Ejd/Qg1ChQ
	 Eq15FvPnQsTSsdQu6RWvKTwGFtyAA6/aEyfZQedqAn2kQU+XVJt3/fAB/BEslDMAvg
	 zuMQDCEnoZmsA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1595F4C0B1;
	Sun, 22 Nov 2026 13:36:23 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 14:36:21 +0100
Subject: [PATCH 1/2] remoteproc: qcom: pas: add SC8180X SLPI compatible
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-sc8180x-slpi-v1-1-345903fafc96@gmail.com>
References: <20261122-sc8180x-slpi-v1-0-345903fafc96@gmail.com>
In-Reply-To: <20261122-sc8180x-slpi-v1-0-345903fafc96@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354582; l=1360;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=SeluMMGriinjyNsgC4NIGONS30tI/MuFdGdGq+5z5kM=;
 b=5gk+Vr/ojxgoPSgYD9SuROAunRDBbgWCQ3kVW9T5WEBUMuyAcnoyPS+FnEdqXYpnI+FwVJuLm
 O4/KAD779iPChYwlU5TtOrf1Wj2ZI6oHe+ZaO2FQBdC789zXmjH0RZ2
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

The SC8180X SLPI (Sensors Low-Power Island) shares the same PAS ID (12),
LCX/LMX power domains, and resource layout as SDM845 and SM8150, and
the compatible string "qcom,sc8180x-slpi-pas" is already documented in
Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml.

Add the OF match entry for qcom,sc8180x-slpi-pas reusing
sdm845_slpi_resource_init.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index e7dfad2..21587a9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2029,6 +2029,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource },
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource },
 	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource },
+	{ .compatible = "qcom,sc8180x-slpi-pas", .data = &sdm845_slpi_resource_init },
 	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource },
 	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource },
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },

-- 
2.56.0


