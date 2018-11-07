Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Wed, 7 Nov 2018 22:25:47 +0800
Message-ID: <CAH2Cfb_yqjYSNf62rvwsOGCG-x+XVNBGwdKrBCfuCO0B2SSSUQ@mail.gmail.com>
Subject: Regression by commit 7e83cab824a86704cdbd7735c19d34e0ce423dc5
Content-Type: multipart/alternative; boundary="00000000000066cf8d057a13e690"
To: linux-remoteproc@vger.kernel.org, spjoshi@codeaurora.org, bjorn.andersson@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

--00000000000066cf8d057a13e690
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This commit replace rproc_{shutdown,boot}() with rproc_{stop,start}(),
which skip destroy the virtio device at stop but reinitialize it again at
start:
[  603.446805] remoteproc remoteproc0: crash detected in
f9210000.toppwr:tl421-rproc: type mmufault
[  603.456883] remoteproc remoteproc0: handling crash #1 in
f9210000.toppwr:tl421-rproc
[  603.469593] remoteproc remoteproc0: recovering
f9210000.toppwr:tl421-rproc
[  603.483172] remoteproc remoteproc0: stopped remote processor
f9210000.toppwr:tl421-rproc
[  603.495999] kobject (ffffffc0b8c51098): tried to init an initialized
object, something is seriously wrong.

  ^^^^^^^^^^^^^^^^^^^^^
[  603.506868] CPU: 5 PID: 198 Comm: kworker/5:1 Tainted: G        W
 4.9.27-04454-gd4c1829-dirty #255
[  603.517468] Hardware name: Banks (DT)
[  603.521581] Workqueue: events rproc_crash_handler_work
[  603.527342] Call trace:
[  603.530086] [<ffffff800808bd9c>] dump_backtrace+0x0/0x1cc
[  603.536115] [<ffffff800808bf7c>] show_stack+0x14/0x1c
[  603.541771] [<ffffff80083fef08>] dump_stack+0xa8/0xe0
[  603.547423] [<ffffff8008402b24>] kobject_init+0x8c/0x9c
[  603.553280] [<ffffff800853758c>] device_initialize+0x3c/0xe8
[  603.559609] [<ffffff80085397d4>] device_register+0x14/0x28
[  603.565750] [<ffffff80084b777c>] register_virtio_device+0xc4/0x114
[  603.572669] [<ffffff8008878b20>] rproc_add_virtio_dev+0x7c/0x108
[  603.579390] [<ffffff8008875cbc>] rproc_vdev_do_probe+0x14/0x1c
[  603.585911] [<ffffff8008875a60>] rproc_start+0xac/0x1ac
[  603.591754] [<ffffff8008877a68>] rproc_trigger_recovery+0x2f8/0x324
[  603.598763] [<ffffff8008877b24>] rproc_crash_handler_work+0x90/0xb0
[  603.605778] [<ffffff80080cd570>] process_one_work+0x204/0x704
[  603.612202] [<ffffff80080cdac4>] worker_thread+0x54/0x4a8
[  603.618248] [<ffffff80080d4aec>] kthread+0xec/0x100
[  603.623703] [<ffffff8008083890>] ret_from_fork+0x10/0x40

When the crash happen, is it better to destroy and recreate all virtio
device and it=E2=80=99s children(rpmsg device) again to match the remote si=
de state
like the original behavior?


Thanks

Xiang

--00000000000066cf8d057a13e690
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><p class=3D"gmail-MsoPlainText" styl=
e=3D"margin:0cm 0cm 0.0001pt;font-size:10.5pt;font-family:Calibri,sans-seri=
f"><span lang=3D"EN-US">This commit replace
rproc_{shutdown,boot}() with rproc_{stop,start}(), which skip destroy the
virtio device at stop but reinitialize it again at start:</span></p></div><=
div>[=C2=A0 603.446805] remoteproc remoteproc0: crash detected in f9210000.=
toppwr:tl421-rproc: type mmufault</div><div>[=C2=A0 603.456883] remoteproc =
remoteproc0: handling crash #1 in f9210000.toppwr:tl421-rproc</div><div>[=
=C2=A0 603.469593] remoteproc remoteproc0: recovering f9210000.toppwr:tl421=
-rproc</div><div>[=C2=A0 603.483172] remoteproc remoteproc0: stopped remote=
 processor f9210000.toppwr:tl421-rproc<br></div><div>[=C2=A0 603.495999] ko=
bject (ffffffc0b8c51098): tried to init an initialized object, something is=
 seriously wrong.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^^^^^^^^^^^^^^^^^^^^^</div><div>[=C2=A0 603.506868] CPU: 5 PID: 198 =
Comm: kworker/5:1 Tainted: G=C2=A0 =C2=A0 =C2=A0 =C2=A0 W=C2=A0 =C2=A0 =C2=
=A0 =C2=A04.9.27-04454-gd4c1829-dirty #255</div><div>[=C2=A0 603.517468] Ha=
rdware name: Banks (DT)</div><div>[=C2=A0 603.521581] Workqueue: events rpr=
oc_crash_handler_work</div><div>[=C2=A0 603.527342] Call trace:</div><div>[=
=C2=A0 603.530086] [&lt;ffffff800808bd9c&gt;] dump_backtrace+0x0/0x1cc</div=
><div>[=C2=A0 603.536115] [&lt;ffffff800808bf7c&gt;] show_stack+0x14/0x1c</=
div><div>[=C2=A0 603.541771] [&lt;ffffff80083fef08&gt;] dump_stack+0xa8/0xe=
0</div><div>[=C2=A0 603.547423] [&lt;ffffff8008402b24&gt;] kobject_init+0x8=
c/0x9c</div><div>[=C2=A0 603.553280] [&lt;ffffff800853758c&gt;] device_init=
ialize+0x3c/0xe8</div><div>[=C2=A0 603.559609] [&lt;ffffff80085397d4&gt;] d=
evice_register+0x14/0x28</div><div>[=C2=A0 603.565750] [&lt;ffffff80084b777=
c&gt;] register_virtio_device+0xc4/0x114</div><div>[=C2=A0 603.572669] [&lt=
;ffffff8008878b20&gt;] rproc_add_virtio_dev+0x7c/0x108</div><div>[=C2=A0 60=
3.579390] [&lt;ffffff8008875cbc&gt;] rproc_vdev_do_probe+0x14/0x1c</div><di=
v>[=C2=A0 603.585911] [&lt;ffffff8008875a60&gt;] rproc_start+0xac/0x1ac</di=
v><div>[=C2=A0 603.591754] [&lt;ffffff8008877a68&gt;] rproc_trigger_recover=
y+0x2f8/0x324</div><div>[=C2=A0 603.598763] [&lt;ffffff8008877b24&gt;] rpro=
c_crash_handler_work+0x90/0xb0</div><div>[=C2=A0 603.605778] [&lt;ffffff800=
80cd570&gt;] process_one_work+0x204/0x704</div><div>[=C2=A0 603.612202] [&l=
t;ffffff80080cdac4&gt;] worker_thread+0x54/0x4a8</div><div>[=C2=A0 603.6182=
48] [&lt;ffffff80080d4aec&gt;] kthread+0xec/0x100</div><div>[=C2=A0 603.623=
703] [&lt;ffffff8008083890&gt;] ret_from_fork+0x10/0x40</div><div><p class=
=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:10.5pt;f=
ont-family:Calibri,sans-serif"><span lang=3D"EN-US">When the crash happen, =
is it</span><span lang=3D"EN-US">=C2=A0better to destroy and recreate all v=
irtio device and it</span><span lang=3D"EN-US" style=3D"font-family:&quot;C=
ourier New&quot;">=E2=80=99</span><span lang=3D"EN-US">s children(rpmsg dev=
ice) again to match the remote side state like
the original behavior?</span></p><p class=3D"gmail-MsoPlainText" style=3D"m=
argin:0cm 0cm 0.0001pt;font-size:10.5pt;font-family:Calibri,sans-serif"><sp=
an lang=3D"EN-US"><br></span></p><p class=3D"gmail-MsoPlainText" style=3D"m=
argin:0cm 0cm 0.0001pt;font-size:10.5pt;font-family:Calibri,sans-serif"><sp=
an lang=3D"EN-US">Thanks</span></p><p class=3D"gmail-MsoPlainText" style=3D=
"margin:0cm 0cm 0.0001pt;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span lang=3D"EN-US">Xiang</span></p></div></div></div>

--00000000000066cf8d057a13e690--
