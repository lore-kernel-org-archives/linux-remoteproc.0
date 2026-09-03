Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A3B3EF0AA;
	Thu,  3 Sep 2026 19:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463888; cv=none; b=SCRiQyWDzNY4XDTpj0bVqMUWTM/ywboLQzeZFjOI/TOzHIx7OCkz5AwdR/o4q8s59EW0NgElfpnPUU9nsxbvmJ/0O+JmP3qb2zZxl1o1QDBtxpNYqm+qe6sNCfK/XygFhTqRGyJkwtQQzowskXef7jOy2jOF01NAkc+sB+q++pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463888; c=relaxed/simple;
	bh=RiuRteDU+uTD0zS6hNSwLSTTsSvAo1qEzMyoL96FS2g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N+Q9zpY8Ik2EJ/SQ03QZSH6cW3gtiUUAUkN/5k2sEC5O5xVZC4HLUa9oKnA5M3RWe2rn0I27box4M+iG7ptB7ZgGUnNSZUXXICdgFV0ERRipKH1ckFUgY7DOziHvimYWXKILsuuL9lm5aD0c14hjm2+emCszgXUNdCVKgLdk3QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=FBLJUA5+; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="FBLJUA5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1788463855; x=1789068655; i=spasswolf@web.de;
	bh=VHrPGYsIxPoFjuJpVWa/8q3DFNrwaP1gIZasAnQmb+U=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FBLJUA5+1lgXw7Ps9Vfe6B7ref3BfYqap/+AZk5f5FVp3cg4Z5yHG9D9+0FpYZyE
	 maUXzMI71c6qeUDba8Xzo73TAvvVbA5zcAyVfb//vcMgznmNeo+7Gw8KncbIHCLKJ
	 mMk38H1xoX2G2o5UdNxLkGTu3hf7L0lGJnPVTzrQBu2LVH2aNmHb4vMcH7Rb0/sfS
	 jUn4Wjs0DRXWi1FrQiU8cskkTgwoy/CWIQUYahOfB5KAl51bdCk/B6pu912d6oL0h
	 ryqHdUdDPDRSlxlg9L6cL2LJ8ZHkPvgvWgq6nCbzkS91tR8BMsc48T2R35hgLHYx5
	 LzdKeQ5jnNOM6d5gUQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MXGK4-1xNdTM3uFK-00T1cJ; Thu, 03
 Sep 2026 21:30:55 +0200
Message-ID: <c649f42b7193d673a94a875c53e553fe3221e40b.camel@web.de>
Subject: Re: SDM632 SLIMbus: ADSP framer never gets frame-sync under
 q6v5-pas (works under downstream pil-tz, identical firmware) - what
 physical precondition is PAS missing?
From: Bert Karwatzki <spasswolf@web.de>
To: =?ISO-8859-1?Q?Lajosh=E1zi_L=E1szl=F3?= Gergely <lajoshazilg@gmail.com>,
  Srinivas Kandagatla	 <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Luca Weiss	 <luca.weiss@fairphone.com>, spasswolf@web.de
Date: Thu, 03 Sep 2026 21:30:54 +0200
In-Reply-To: <CAAD3nBcJjY2We7Y9DNVoHxMwe-ojCXP2X-gbXYNwPJh_aZR=hw@mail.gmail.com>
References: 
	<CAAD3nBebR3GPbufLyc95QVwueLBUWmGpxQhqtSt3EBEswjpdVw@mail.gmail.com>
	 <CAAD3nBcJjY2We7Y9DNVoHxMwe-ojCXP2X-gbXYNwPJh_aZR=hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2-10+b1 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eBZQx/F0Pw08boRnh1+26/2LR0+ZUjO4Q+g636g4BQLhJHp8jdo
 yttGLxnKS1UHgOUdmxlM5PvvmZmZZdmFuma6ob35fN0ObMKqHyq7dObVL5+85ACrLBHx42W
 weVYUYHHEHOpcB3ajin33UjtHTF4kah6+XcB1seaDphgi0dv56hdF7hl14rSajAUWTLIXKr
 kO5ANeKWSuJCc35iYAJ5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rfg2RgQC9as=;S8JdtkzOl6b562fARh1wTLLlePf
 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
 00eSvAQESXNYKzNPA==

Am Freitag, dem 24.07.2026 um 10:59 +0200 schrieb Lajosh=C3=A1zi L=C3=A1sz=
l=C3=B3 Gergely:
> Hi Srinivas, all,
>=20
> With the help of Claude Code it has been solved, playback works in the h=
eadset.
> Fixable in the kernel - no TZ/PIL-internal change. The last difference
> wasn't a PHY-pad or
>  xPU precondition, it's a single AP-writable bit in the ADSP CSR:
>=20
>   QDSP6SS 0x0c20002c, bit 3 (c200000.remoteproc aperture)
>     downstream PIL leaves it clear (0x103); mainline PAS leaves it set (=
0x10b)
>=20
> With bit3 set the framer never gets frame-sync (the INTF_STAT +0x604 =3D=
 0
> loop I quoted); clear it and +0x604 reads 0x3e04, NGD capability complet=
es,
> the WCD9335 gets a logical address.
>=20
> Timing subtlety that hid it: right after pas_auth_and_reset the bit alre=
ady
> reads clear, so clearing it there is a no-op - the ADSP re-sets it durin=
g
> its own init. The clear has to land in the NGD path just before the
> capability exchange. I do it in qcom_slim_ngd_power_up() before NGD_INT_=
EN,
> gated by a DT property carrying the register address.
>=20
> Verified on msm8953-mainline, 6.13 through 7.0.9, Fairphone 3: codec
> enumerates, ALSA card comes up, and playback now reaches the headphone/
> earpiece output (clean audio). A first-attempt capability timeout remain=
s
> (ADSP needs ~3 s; the existing NGD retry recovers it).
>=20
> Two things I'd value your steer on before a series:
>=20
> (1) Where should the register address live - per-board DT property on th=
e
>     NGD node (what I have), a soc-data quirk keyed off compatible, or th=
e
>     remoteproc side? This should help the whole SDM632/msm8953 + WCD9335
>     family.
> (2) Do you know what bit3 actually gates? A proper name/comment would tu=
rn
>     it from a magic poke into a described fix - it behaves like somethin=
g
>     PIL ungates for the framer that PAS leaves gated.
>=20
> WIP branch (personal fork, not for upstream as-is): github.com/llg179/li=
nux,
> branch fp3-709.
>=20
> Thanks - and to Bert Karwatzki, whose working FP3 config was my referenc=
e.
>=20
> Best regards,
> L=C3=A1szl=C3=B3
>=20
>=20
> Lajosh=C3=A1zi L=C3=A1szl=C3=B3 Gergely <lajoshazilg@gmail.com> ezt =C3=
=ADrta (id=C5=91pont:
> 2026. j=C3=BAl. 20., H, 2:16):
> >=20
> > Hi Srinivas, all,
> >=20
> > On the Fairphone 3 (SDM632/msm8953, WCD9326 codec) mainline SLIMbus au=
dio
> > is silent: the NGD reports "capability exchange timed-out STATUS=3D0x4=
0c
> > CFG=3D0x0 INT_STAT=3D0x0" and the codec never gets a logical address. =
Same
> > hardware works on the downstream 4.9 stack (A/B slots, same phone). Wi=
th Claude
> > code I've localized it to one register-level difference and I'm stuck
> > on the last step.
> >=20
> > The only variable is the ADSP boot method: downstream subsys-pil-tz vs
> > mainline qcom_q6v5_pas. adsp.mbn and its devcfg are byte-identical; th=
e
> > AP-side QMI sequence is byte-identical and ACKed in both cases; curren=
t
> > mainline HEAD (including the merged qcom-ngd-ctrl fix series) reproduc=
es
> > it, cold-boot retested.
> >=20
> > Reading the SLIMbus block (0x0c140000) and LPASS-CC (0x0c000000) via
> > /dev/mem on both slots:
> >=20
> >   reg (0x0c140000 +off)      downstream/PIL   mainline/PAS
> >   FRM_CFG   +0x400            0x000D0C83       0x000D0C83   identical
> >   INTF_CFG  +0x600            0x00000001       0x00000001   identical
> >   FRM_STAT  +0x404            0x060D1901       0x00000000
> >   INTF_STAT +0x604            0x00003E04       0x00000000
> >=20
> > LPASS-CC is byte-identical over the whole aperture (SLIMbus root RCGR
> > CFG=3D0x509, branch CLK_OFF=3D0 on both -- the 24.576 MHz root clock r=
uns on
> > the dead side too). So the framer is configured and clocked identicall=
y;
> > only the status registers read 0 under PAS: INTF_STAT bits FS/SFS/MS
> > (frame/super-frame/master sync) never set -- the interface never acqui=
res
> > sync on the physical bus. The stock firmware's own bring-up confirms i=
t
> > waits on hardware: it polls the FS bit, times out ("Hardware failed to
> > enumerate ... (FS:0)(SFS:0)(MS:0)"), and its subsequent HW reset succe=
eds,
> > so ADSP register access is fine. The firmware maps no separate PHY/ana=
log
> > block. On msm8953 I find no AP-side lever either: no lpasscc, nothing
> > SLIMbus in gcc, no LPASS GDSC (unlike msm8996, which frames the same c=
odec
> > family under PAS).
> >=20
> > Two questions:
> >=20
> > (1) What physical precondition (rail / reset-deassert / pad / LPASS-in=
ternal
> > enable) must hold for the SLIMbus interface to acquire frame-sync on
> > SDM632, and where does the pil-tz path establish it that q6v5_pas does=
 not?
> >=20
> > (2) Is that step AP-reachable from mainline (SCM call, reset, regulato=
r
> > vote, clock, DT), or only TZ/PIL-internal -- i.e. is this fixable with=
 a
> > kernel patch at all, or does it need a vendor-side change?
> >=20
> > Full write-up, two-sided register dumps, binary diffs and the annotate=
d
> > firmware disassembly: https://github.com/msm8953-mainline/linux/issues=
/255
> >=20
> > Thanks for any pointer,
> > L=C3=A1szl=C3=B3

Now I finally got to test your kernel (with arm64 debian stable/trixie as =
userspace)
on my Fairphone3. I'm currently running=C2=A0
commit 5bc4d5ebb7c0 ("ASoC: wcd9335: drop a stray blank line this series a=
dded") as
HEAD (with two patches I'll explain below)

1. Congratulation to you (and Claude ;-)). Call audio works great!

2. My Fairphone3 is the model with the lc898127 actuator (which by the way=
 needs two
regulators, otherwise i2c transaction time out) and also has the imx363 ca=
mera on=C2=A0
a different i2c address. To address this issues I'm using the
following patch (this disables your camera configuratoin, to address this
issue properly one could probably use individual device trees including
a comon Fairphone3 device tree):

commit 8dc38ed9807fba7a70bd0f947b09b9bcad2a1dc7
Author: Bert Karwatzki <spasswolf@web.de>
Date:   Mon Aug 31 00:35:52 2026 +0200

    i2c/lc898217: fix camera address and lc898217 supplies for older Fairp=
hone 3
   =20
    This sets up the camera sensors and actuator for the older version
    of the Fairphone 3. If we want to support both cameras, do we
    need two (or three with the Fairphone 3+) device trees (each
    device specific devicce tree including a sdm632-fairphone-common.dtsi)=
?
   =20
    Signed-off-by: Bert Karwatzki <spasswolf@web.de>

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm6=
4/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 3abd4b0f89f0..5f682f576e83 100644
=2D-- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -223,6 +223,51 @@ &cci {
 };
=20
 &cci_i2c0 {
+/* Sony IMX363 (rear) @ 0x10 This is the older(?) version
+ * paired with lens actuator LC898217XC */
+	camera@10 {
+		compatible =3D "sony,imx363";
+		reg =3D <0x10>;
+
+		/* Rear (world-facing) sensor, mounted rotated 270 degrees. */
+		orientation =3D <1>;
+		rotation =3D <270>;
+
+		reset-gpios =3D <&tlmm 40 GPIO_ACTIVE_HIGH>;
+
+		clocks =3D <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clocks =3D <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clock-rates =3D <24000000>;
+		clock-frequency =3D <24000000>;
+
+		vana-supply =3D <&pm8953_l22>;	/* 2.8V analog */
+		vdig-supply =3D <&pm8953_l2>;	/* 1.2V digital core */
+		vif-supply =3D <&vreg_cam_io_1p8>;	/* 1.8V IO */
+
+		lens-focus =3D <&camera_lens>;
+
+		port {
+			imx363_ep: endpoint {
+				data-lanes =3D <0 1 2 3>;
+				link-frequencies =3D /bits/ 64
+					<636000000 321000000>;
+				remote-endpoint =3D <&csiphy0_ep>;
+			};
+		};
+	};
+
+	camera_lens: camera-lens@72 {
+		compatible =3D "onnn,lc898217xc";
+		reg =3D <0x72>;
+
+		vaf-supply =3D <&vreg_cam_af_2p85>;
+		/* The vio supply is needed because when probing the
+		 * actuator the camera sensor has already powered down
+		 * again causing i2c transactions to time out.
+		 */
+		vio-supply =3D <&vreg_cam_io_1p8>;  /* 1.8V IO */
+	};
+#if 0
 	/* Sony IMX363 (rear) @ 0x1a (SLASEL strapped high on FP3) */
 	camera@1a {
 		compatible =3D "sony,imx363";
@@ -255,13 +300,6 @@ imx363_ep: endpoint {
 		};
 	};
=20
-	eeprom@50 {
-		compatible =3D "belling,bl24s64", "atmel,24c64";
-		reg =3D <0x50>;
-		vcc-supply =3D <&vreg_cam_io_1p8>;
-		read-only;
-	};
-
 	/*
 	 * Fairphone ships this phone with two different rear camera modules,
 	 * and they do not carry the same focus actuator: the vendor camera
@@ -278,6 +316,13 @@ camera_lens: camera-lens@c {
 		vdd-supply =3D <&vreg_cam_af_2p85>;
 		vio-supply =3D <&vreg_cam_io_1p8>;
 	};
+#endif
+	eeprom@50 {
+		compatible =3D "belling,bl24s64", "atmel,24c64";
+		reg =3D <0x50>;
+		vcc-supply =3D <&vreg_cam_io_1p8>;
+		read-only;
+	};
 };
=20
 &cci_i2c1 {
diff --git a/drivers/media/i2c/lc898217.c b/drivers/media/i2c/lc898217.c
index 650c4146c0ef..b3dea1b41355 100644
=2D-- a/drivers/media/i2c/lc898217.c
+++ b/drivers/media/i2c/lc898217.c
@@ -49,11 +49,16 @@ static inline u16 lc898217_position_to_code(s32 positi=
on)
 	return LC898217_FOCUS_MAX - position;
 }
=20
+static const char * const lc898217_supply_names[] =3D {
+	"vaf",
+	"vio",
+};
+
 struct lc898217 {
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_subdev sd;
 	struct v4l2_ctrl *focus;
-	struct regulator *vcc;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(lc898217_supply_names)];
 };
=20
 static inline struct lc898217 *ctrl_to_lc898217(struct v4l2_ctrl *ctrl)
@@ -82,7 +87,6 @@ static int lc898217_write(struct lc898217 *lc898217, u8 =
reg, u16 val, u8 size)
 		return ret;
 	if (ret !=3D size + 1)
 		return -EIO;
-
 	return 0;
 }
=20
@@ -153,10 +157,16 @@ static int lc898217_probe(struct i2c_client *client)
 	if (!lc898217)
 		return -ENOMEM;
=20
-	lc898217->vcc =3D devm_regulator_get(dev, "vcc");
-	if (IS_ERR(lc898217->vcc))
-		return dev_err_probe(dev, PTR_ERR(lc898217->vcc),
-				     "failed to get the vcc regulator\n");
+	for (int i =3D 0; i < ARRAY_SIZE(lc898217_supply_names); i++)
+		lc898217->supplies[i].supply =3D lc898217_supply_names[i];
+
+	ret =3D devm_regulator_bulk_get(&client->dev,
+				      ARRAY_SIZE(lc898217_supply_names),
+				      lc898217->supplies);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to get regulators\n");
+		return ret;
+	}
=20
 	v4l2_i2c_subdev_init(&lc898217->sd, client, &lc898217_ops);
 	lc898217->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -192,7 +202,8 @@ static int lc898217_runtime_suspend(struct device *dev=
)
 	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
 	struct lc898217 *lc898217 =3D sd_to_lc898217(sd);
=20
-	return regulator_disable(lc898217->vcc);
+	return regulator_bulk_disable(ARRAY_SIZE(lc898217_supply_names),
+				      lc898217->supplies);
 }
=20
 static int lc898217_runtime_resume(struct device *dev)
@@ -202,7 +213,8 @@ static int lc898217_runtime_resume(struct device *dev)
 	unsigned int tries;
 	int ret;
=20
-	ret =3D regulator_enable(lc898217->vcc);
+	ret =3D regulator_bulk_enable(ARRAY_SIZE(lc898217_supply_names),
+				    lc898217->supplies);
 	if (ret)
 		return ret;
=20
@@ -218,7 +230,7 @@ static int lc898217_runtime_resume(struct device *dev)
 	}
 	if (ret) {
 		dev_err(dev, "failed to enable the actuator: %d\n", ret);
-		goto err_disable_vcc;
+		goto err_disable_regulators;
 	}
=20
 	usleep_range(LC898217_ENABLE_DELAY_US, LC898217_ENABLE_DELAY_US + 500);
@@ -226,13 +238,15 @@ static int lc898217_runtime_resume(struct device *de=
v)
 	ret =3D lc898217_set_position(lc898217, lc898217->focus->val);
 	if (ret) {
 		dev_err(dev, "failed to set the lens position: %d\n", ret);
-		goto err_disable_vcc;
+		goto err_disable_regulators;
 	}
=20
+	dev_info(dev, "lc898217 regulator resumed successfully\n");
 	return 0;
=20
-err_disable_vcc:
-	regulator_disable(lc898217->vcc);
+err_disable_regulators:
+	regulator_bulk_disable(ARRAY_SIZE(lc898217_supply_names),
+					  lc898217->supplies);
=20
 	return ret;
 }

3. Commit=C2=A0
1ac2e21fbf3a ("arm64: dts: qcom: msm8953: name the right affinity level fo=
r system-pc")
breaks my touchscreen, after resuming from suspend i2c transcaction will t=
ime out making
the device unusable (ssh'ing into the device works fine)

Error messages:

[    T128] Himax-hx83112b-TS 0-0048: Failed to read input event: -110
[    T128] Himax-hx83112b-TS 0-0048: Failed to read input event: -6

Reverting this commit fixes the issue.

4. Waking up from suspend by an incomming call or sms works, but there are=
 also a
lot of unwanted wakeup (especially with mobile data enabled). The time bet=
ween those
unwanted wakeups is a few seconds up to an hour. This was expected and can=
 be worked
around like this (this also declares smd edges as wakeup capable, but inst=
ead of
declaring the edge irq as a wakeup irq, the wakeup is initiated by qcom_sm=
d_qrtr_callback()
which checks the ports relating the call and sms services first (the portn=
umber
for these service come from the qrtr-lookup tool, but could also be read f=
rom a
socket with AF_QIPCRTR (this is how qrtr-lookup gets these numbers))):

https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/work_items/=
694#note_2648210

This is rather hacky though, I have not yet figured out how the downstream=
 kernel
avoid unwanted wakeups.

5. Is it possible to add an issues tab to your github repo, these issue co=
uld be discussed?
   =20
Bert Karwatzki

